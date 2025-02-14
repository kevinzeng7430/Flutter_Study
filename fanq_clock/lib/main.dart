import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

// Ensure this part directive points to the correct path
part 'data_model.g.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(TaskRecordAdapter());
  await Hive.openBox<TaskRecord>('tasks');
  runApp(MyApp());
}

@HiveType(typeId: 0)
class TaskRecord extends HiveObject {
  @HiveField(0)
  final String id;
  
  @HiveField(1)
  final String taskName;
  
  @HiveField(2)
  final DateTime startTime;
  
  @HiveField(3)
  final int duration;

  TaskRecord({
    required this.id,
    required this.taskName,
    required this.startTime,
    required this.duration,
  });
}

class TaskProvider with ChangeNotifier {
  final Box<TaskRecord> _taskBox = Hive.box<TaskRecord>('tasks');

  List<TaskRecord> get tasks => _taskBox.values.toList();

  void addTask(TaskRecord task) {
    _taskBox.add(task);
    notifyListeners();
  }

  Map<DateTime, List<TaskRecord>> get groupedTasks {
    Map<DateTime, List<TaskRecord>> map = {};
    for (var task in tasks) {
      final date = DateTime(task.startTime.year, task.startTime.month, task.startTime.day);
      if (map[date] == null) map[date] = [];
      map[date]!.add(task);
    }
    return map;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskProvider(),
      child: MaterialApp(
        title: '番茄钟',
        theme: ThemeData(primarySwatch: Colors.red),
        home: MainScreen(),
      ),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  final List<Widget> _screens = [
    TimerTab(),
    DailySummaryTab(),
    CalendarTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('番茄钟')),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.timer), label: '计时'),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: '汇总'),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: '日历'),
        ],
        onTap: (index) => setState(() => _currentIndex = index),
      ),
    );
  }
}

class TimerTab extends StatefulWidget {
  const TimerTab({super.key});

  @override
  _TimerTabState createState() => _TimerTabState();
}

class _TimerTabState extends State<TimerTab> {
  final TextEditingController _controller = TextEditingController();
  Duration _duration = Duration.zero;
  Timer? _timer;
  DateTime? _startTime;

  void _startTimer() {
    if (_controller.text.isEmpty) return;
    
    setState(() {
      _startTime = DateTime.now();
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        setState(() => _duration = Duration(seconds: timer.tick));
      });
    });
  }

  void _stopTimer() {
    _timer?.cancel();
    if (_startTime != null) {
      final task = TaskRecord(
        id: const Uuid().v4(),
        taskName: _controller.text,
        startTime: _startTime!,
        duration: _duration.inSeconds,
      );
      context.read<TaskProvider>().addTask(task);
      _resetTimer();
    }
  }

  void _resetTimer() {
    setState(() {
      _duration = Duration.zero;
      _controller.clear();
      _startTime = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            controller: _controller,
            decoration: const InputDecoration(
              labelText: '任务名称',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            '${_duration.inHours.toString().padLeft(2, '0')}:'
            '${(_duration.inMinutes % 60).toString().padLeft(2, '0')}:'
            '${(_duration.inSeconds % 60).toString().padLeft(2, '0')}',
            style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (_timer == null)
                ElevatedButton.icon(
                  icon: const Icon(Icons.play_arrow),
                  label: const Text('开始'),
                  onPressed: _startTimer,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  ),
                )
              else
                ElevatedButton.icon(
                  icon: const Icon(Icons.stop),
                  label: const Text('停止'),
                  onPressed: _stopTimer,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class DailySummaryTab extends StatelessWidget {
  const DailySummaryTab({super.key});

  @override
  Widget build(BuildContext context) {
    final tasks = context.watch<TaskProvider>().tasks;
    final dailySummary = <String, int>{};

    for (var task in tasks) {
      final date = DateFormat('yyyy-MM-dd').format(task.startTime);
      dailySummary.update(
        date,
        (value) => value + task.duration,
        ifAbsent: () => task.duration,
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: dailySummary.length,
      itemBuilder: (context, index) {
        final date = dailySummary.keys.elementAt(index);
        final duration = dailySummary[date]!;
        return Card(
          child: ListTile(
            title: Text(date),
            trailing: Text('${duration ~/ 3600}h ${(duration % 3600) ~/ 60}m'),
          ),
        );
      },
    );
  }
}

class CalendarTab extends StatefulWidget {
  const CalendarTab({super.key});

  @override
  _CalendarTabState createState() => _CalendarTabState();
}

class _CalendarTabState extends State<CalendarTab> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    final tasks = context.watch<TaskProvider>().groupedTasks;

    return Column(
      children: [
        TableCalendar(
          firstDay: DateTime.utc(2020),
          lastDay: DateTime.utc(2030),
          focusedDay: _focusedDay,
          calendarFormat: _calendarFormat,
          eventLoader: (day) => tasks[day] ?? [],
          selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
          onDaySelected: (selectedDay, focusedDay) {
            setState(() {
              _selectedDay = selectedDay;
              _focusedDay = focusedDay;
            });
          },
          onFormatChanged: (format) => setState(() => _calendarFormat = format),
          onPageChanged: (focusedDay) => _focusedDay = focusedDay,
        ),
        Expanded(
          child: _selectedDay == null
              ? const Center(child: Text('选择日期查看任务'))
              : _buildTaskList(_selectedDay!),
        ),
      ],
    );
  }

  Widget _buildTaskList(DateTime day) {
    final tasks = context.watch<TaskProvider>().groupedTasks[day] ?? [];

    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        final task = tasks[index];
        return ListTile(
          title: Text(task.taskName),
          subtitle: Text(DateFormat.Hms().format(task.startTime)),
          trailing: Text('${task.duration ~/ 60}m'),
        );
      },
    );
  }
}