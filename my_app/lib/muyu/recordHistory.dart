import 'package:flutter/material.dart';
import 'package:my_app/muyu/models/meritRecord.dart';
import 'package:intl/intl.dart';

DateFormat format = DateFormat('yyyy年MM月dd日 HH:mm:ss');

class RecordHistoryPage extends StatelessWidget {
  final List<Meritrecord> records;
  const RecordHistoryPage({super.key, required this.records});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(),
      body: ListView(
        children:List.generate(records.length, (index) => _buildItem(context, index)),
      ),
    );
  }

  PreferredSizeWidget _buildAppbar() => AppBar(
    iconTheme: const IconThemeData(color: Colors.black),
    centerTitle: true,
    title: const Text(
      "功德记录",
      style: TextStyle(color: Colors.black, fontSize: 16),
    ),
    elevation: 0,
    backgroundColor: Colors.white, 
  );
  Widget _buildItem(BuildContext context, int index) {
    Meritrecord merit = records[index];
    String date =format.format(DateTime.fromMillisecondsSinceEpoch(merit.timestapm));
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.red,
        backgroundImage: AssetImage(merit.image),
      ),
      title: Text('功德+${merit.value}'),
      subtitle: Text(merit.audio),
      trailing: Text(date, style: const TextStyle(fontSize: 12, color: Colors.grey)),
    );
  }
}
