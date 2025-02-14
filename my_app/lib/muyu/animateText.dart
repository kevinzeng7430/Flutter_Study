import 'package:flutter/material.dart';
import 'package:my_app/muyu/models/meritRecord.dart';

class AnimateText extends StatefulWidget {
  final Meritrecord record;
  const AnimateText({super.key, required this.record});

  @override
  State<AnimateText> createState() => _AnimateTextState();
}

class _AnimateTextState extends State<AnimateText> with SingleTickerProviderStateMixin{
  late AnimationController controller;
  late Animation<double> opacity;
  late Animation<Offset> position;
  late Animation<double> scale;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this, //使用 this 作为 TickerProvider
      duration: const Duration(milliseconds: 500),
    );
    opacity = Tween(begin: 1.0, end: 0.0).animate(controller);
    scale = Tween(begin: 1.0, end: 0.9).animate(controller);
    position = Tween<Offset>(begin: const Offset(0, 2), end: Offset.zero).animate(controller);
    controller.forward(); //启动动画控制器，使动画从开始值平滑过渡到结束值。
  }

  @override
  void didUpdateWidget(covariant AnimateText oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.record.id != widget.record.id) {
      controller.forward(from: 0);
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: scale,
      child: SlideTransition(
        position: position,
        child: FadeTransition(
          opacity: opacity,
          child: Text('功德+${widget.record.value}'),
          ),
      ),
    );
  }
}
