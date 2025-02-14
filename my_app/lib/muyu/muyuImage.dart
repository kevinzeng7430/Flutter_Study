import 'package:flutter/material.dart';

class MuyuImage extends StatelessWidget {

  final String image;
  final VoidCallback onTap;

  const MuyuImage({
    super.key,
    required this.onTap,
    required this.image,
    });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector( //触摸检测
        onTap: onTap,
        child: Image.asset(image,  height: 200,),
      ),
    );
  }
}