import 'package:flutter/material.dart';
import 'package:my_app/muyu/models/ImageOption.dart';

class ImageOptionPanel extends StatelessWidget {
  final List<ImageOption> imageOptions;
  final ValueChanged<int> onSelected;
  final int activeIndex;

  const ImageOptionPanel({
    super.key,
    required this.imageOptions,
    required this.onSelected,
    required this.activeIndex,
  });

  @override
  Widget build(BuildContext context) {
    const TextStyle labelstyle = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
    );
    const EdgeInsets padding =
        EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0);
    return Material(
      child: SizedBox(
        height: 300,
        child: Column(
          children: [
            Container(
              height: 46,
              alignment: Alignment.center,
              child: const Text(
                '请选择木鱼',
                style: labelstyle,
              ),
            ),
            Expanded(
              child: Padding(
                padding: padding,
                
                child: Row(
                  children: [
                    Expanded(child: _buildByIndex(0)),
                    const SizedBox(width: 10),
                    Expanded(child: _buildByIndex(1)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildByIndex(int index) {
    bool active = index == activeIndex;
    return GestureDetector(
      onTap: () => onSelected(index),
      child: ImageOptionItem(
        option: imageOptions[index],
        active: active,
      ),
    );
  }
}

class ImageOptionItem extends StatelessWidget {
  final ImageOption option;
  final bool active;

  const ImageOptionItem({
    super.key,
    required this.option,
    required this.active,
  });

  @override
  Widget build(BuildContext context) {
    const Border activeBorder =
        Border.fromBorderSide(BorderSide(color: Colors.blue));
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: !active ?  null : activeBorder, // 判断是否选中，选中给蓝色边框
      ),
      child: Column( 
        children: [
          Text(option.name, style:const TextStyle(fontWeight: FontWeight.bold)),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Image.asset(option.path),
            ) 
          ),
          Text('每次功德 + ${option.max}~${option.min}', style: const TextStyle(color: Colors.grey,fontSize: 12)),
        ],
      ),
    );
  }
}
