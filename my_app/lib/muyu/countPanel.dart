import 'package:flutter/material.dart';

class CountPanel extends StatelessWidget {

  
  final int count;
  final VoidCallback onTapSwitchAudio;
  final VoidCallback onTapSwitchImage;

  const CountPanel({
    super.key,
    required this.count,
    required this.onTapSwitchAudio,
    required this.onTapSwitchImage,
  });

 

  @override
  Widget build(BuildContext context) {
    //定义按钮的样式
    final ButtonStyle = ElevatedButton.styleFrom(
      minimumSize: const Size(36, 36),
      //padding: EdgeInsets.zero,
      padding: const EdgeInsets.all(0), 
      backgroundColor: Colors.green,
      elevation: 0, //属性用于设置控件的阴影效果。
    );

    return Stack(
      children: [
        Center(
          child: Text(
            '功德数:$count',
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Positioned( //Positioned 只能有一个子 widget，而你试图给它传递一个 children 列表就会报错。
                    //Positioned 是 Stack 的子 widget，用于在 Stack 中精确定位单个子 widget。
          top: 0,
          right: 0,
          child: Wrap(
            spacing: 8,
            direction: Axis.vertical,
            children:[
              ElevatedButton(
                onPressed: onTapSwitchAudio,
                style: ButtonStyle,
                child: const Icon(Icons.music_note_outlined),
              ),
              ElevatedButton(
                onPressed: onTapSwitchImage, 
                style: ButtonStyle,
                child: const Icon(Icons.image)
              ),
            ],
          )
        ),
      ],
    );
  }
}


