import 'package:flutter/material.dart';

class IconBadge extends StatefulWidget {
  final IconData icon;
  final double size;
  final Color color;

  const IconBadge({
    super.key, 
    required this.icon, 
    this.size = 15.0, 
    this.color = Colors.blue});

  @override
  _IconBadgeState createState() => _IconBadgeState();
}

class _IconBadgeState extends State<IconBadge> {
  final int _count = 0;

  @override
  void initState() {
    super.initState();
    // 初始化逻辑
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Icon(
          widget.icon,
          size: widget.size,
          color: widget.color,
        ),
        Positioned(
          right: 0,
          top: 0,
          child: Container(
            padding:const EdgeInsets.all(1),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(6),
            ),
            height: 12.0,
            width: 12.0,
            child: Container(
              padding: const EdgeInsets.all(1),
              decoration: BoxDecoration(
                color: Colors.red[300]!,
                borderRadius: BorderRadius.circular(6),
              ),
              height: 7.0,
              width: 7.0,
            ),
          ),
        ),
      ],
    );
  }
}