import 'dart:math';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_app/muyu/animateText.dart';
import 'package:my_app/muyu/countPanel.dart';
import 'package:my_app/muyu/models/ImageOption.dart';
import 'package:my_app/muyu/models/meritRecord.dart';
import 'package:my_app/muyu/muyuImage.dart';
import 'package:my_app/muyu/models/AudioOption.dart';
import 'package:my_app/muyu/recordHistory.dart';
import 'package:uuid/uuid.dart';
import 'options/selectAudio.dart';
import 'options/selectImage.dart';

class MuyuPage extends StatefulWidget {
  const MuyuPage({super.key});

  @override
  _MuyuPageState createState() => _MuyuPageState();
}

class _MuyuPageState extends State<MuyuPage> {
  int _counter = 0;
  int _cruValue = 0;

  int _activeAudioIndex = 0;
  int _activeImageIndex = 0;

  final Random _random = Random();

  Meritrecord? _crurecord;
  final Uuid uUid = const Uuid();

  final List<Meritrecord> _records = [];

  final List<AudioOption> audioOptions = const [
    AudioOption('音效1', 'muyu_1.mp3'),
    AudioOption('音效2', 'muyu_2.mp3'),
    AudioOption('音效3', 'muyu_3.mp3'),
  ];
  final List<ImageOption> imageOptions = const [
    ImageOption('基础版', 'assets/image/img1.png', 1, 3),
    ImageOption('尊享版', 'assets/image/img2.png', 3, 6),
  ];

  AudioPool? audioPool;

  @override
  void initState() {
    super.initState();
    _initPool();
  }

  void _initPool() async {
    // 初始化音频池
    audioPool = await FlameAudio.createPool(
      'muyu_1.mp3',
      maxPlayers: 1,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          //这个属性用于设置系统UI覆盖层的样式，包括状态栏和导航栏。
          statusBarBrightness: Brightness
              .dark, //设置navigation的亮度为暗色模式。这意味着状态栏的文字和图标会显示为亮色（通常是白色）。
          statusBarColor: Colors.black, //设置状态栏的背景颜色为透明。这样可以实现状态栏与应用内容的无缝融合。
        ),
        backgroundColor: Colors.white,
        titleTextStyle: const TextStyle(
            color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text('电子木鱼'),
        actions: [
          IconButton(onPressed: _toHistory, icon: const Icon(Icons.history)),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: CountPanel(
              count: _counter,
              onTapSwitchAudio: _onTapSwitchAudio,
              onTapSwitchImage: _onTapSwitchImage,
            ),
          ),
          Expanded(
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                MuyuImage(
                  image: activeImage,
                  onTap: _onknock,
                ),
                if (_crurecord != null) AnimateText(record: _crurecord!)
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _toHistory() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => RecordHistoryPage(records: _records.reversed.toList()),
    ));
  }
  void _onTapSwitchAudio() {
    showCupertinoModalPopup(
        context: context, //这个 context 用于确定模态弹出框应该显示在哪个 widget 树中
        builder: (BuildContext context) {
          return AudioOptionPanel(
            audioOptions: audioOptions,
            activeIndex: _activeAudioIndex,
            onSelected: _onselectedAudio,
          );
        });
  }

  void _onTapSwitchImage() {
    showCupertinoModalPopup(
        context: context,
        builder: (BuildContext context) {
          return ImageOptionPanel(
            imageOptions: imageOptions,
            activeIndex: _activeImageIndex,
            onSelected: _onselectedImage,
          );
        });
  }

  String get activeImage => imageOptions[_activeImageIndex].path;
  void _onselectedImage(int value) async {
    Navigator.of(context).pop();
    if (value == _activeImageIndex) return;
    setState(() {
      _activeImageIndex = value;
    });
  }

  int get knockValue {
    int min = imageOptions[_activeImageIndex].min;
    int max = imageOptions[_activeImageIndex].max;
    return min + _random.nextInt(max + 1 - min);
  }

  void _onknock() {
    audioPool?.start();
    setState(() {
      String id = uUid.v4();
      _crurecord = Meritrecord(
        id,
        DateTime.now().millisecondsSinceEpoch,
        knockValue,
        activeImage,
        activeAudio,
      );
      _cruValue = _crurecord!.value;
      _counter += _cruValue;
      _records.add(_crurecord!);
    });
  }

  String get activeAudio => audioOptions[_activeAudioIndex].path;

  void _onselectedAudio(int value) async {
    Navigator.of(context).pop();
    if (value == _activeAudioIndex) return;
    _activeAudioIndex = value;
    audioPool = await FlameAudio.createPool(activeAudio, maxPlayers: 1);
  }
}
