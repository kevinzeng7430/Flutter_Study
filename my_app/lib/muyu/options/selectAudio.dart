import 'package:flutter/material.dart';
import 'package:flame_audio/flame_audio.dart';

import 'package:my_app/muyu/models/AudioOption.dart';

class AudioOptionPanel extends StatelessWidget {
  final List<AudioOption> audioOptions;
  final ValueChanged<int> onSelected;
  final int activeIndex;

  const AudioOptionPanel({
    super.key,
    required this.audioOptions,
    required this.onSelected,
    required this.activeIndex,
  });

  @override
  Widget build(BuildContext context) {
    const TextStyle labelstyle = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
    );
    return Material(
      child: SizedBox(
        height: 300,
        child: Column(
          children: [
            Container(
              height: 46,
              alignment: Alignment.center,
              child: const Text(
                '请选择音频',
                style: labelstyle,
              ),
            ),
            ...List.generate(audioOptions.length, _buildByIndex), 
            /*
            ... 操作符被称为扩展运算符（spread operator）。它用于将一个集合（如列表或集合）的内容展开成多个单独的元素。在你的代码中，
            ...List.generate(audioOptions.length, _buildByIndex) 的作用是将 List.generate 生成的列表展开成多个单独的元素，
            以便将这些元素添加到另一个列表中。
            */
          ],
        ),
      ),
    );
  }

  Widget _buildByIndex(int index) {
    bool active = index == activeIndex;
    return ListTile(
      selected: active, //active 表示当前项是否被选中，如果 active 为 true，则该项会被高亮显示。
      /*
      onTap 是一个常用的回调函数，用于处理用户点击事件。通常，onTap 回调函数被用于各种可点击的 widgets，如 GestureDetector、InkWell、ElevatedButton 等。
      */
      onTap: () => onSelected(index),
      title: Text(audioOptions[index].name),
      trailing: IconButton( //trailing 属性用于在列表项的右侧显示一个图标按钮。
        splashRadius: 20, 
        onPressed: () => _temPlay(audioOptions[index].path),
        icon: const Icon(
          Icons.record_voice_over_rounded,
          color: Colors.blue,
        ),
      ),
    );
  }

  void _temPlay(String path) async {
    // 播放音频
    AudioPool pool = await FlameAudio.createPool(path, maxPlayers: 1);
    pool.start();
  }
}
