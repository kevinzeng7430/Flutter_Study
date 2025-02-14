import 'package:contraflutterkit/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'blog.dart';

class BlogCardTypeTwo extends StatelessWidget {
  final VoidCallback onTap;
  final Blog blog;

  const BlogCardTypeTwo({super.key, required this.onTap, required this.blog});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          margin: const EdgeInsets.only(top: 24),
          padding: const EdgeInsets.all(24),
          decoration: ShapeDecoration(
              color: blog.bgColor,
              shadows: const [
                BoxShadow(
                  color: wood_smoke,
                  offset: Offset(
                    0.0, // Move to right 10  horizontally
                    4.0, // Move to bottom 5 Vertically
                  ),
                )
              ],
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                  side: BorderSide(color: wood_smoke, width: 2))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "by ${blog.user} • ${blog.time}",
                style: const TextStyle(
                    fontSize: 12, fontWeight: FontWeight.bold, color: trout),
              ),
              const SizedBox(
                height: 24,
              ),
              Text(
                blog.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                    color: wood_smoke),
              ),
            ],
          ),
        ));
  }
}
