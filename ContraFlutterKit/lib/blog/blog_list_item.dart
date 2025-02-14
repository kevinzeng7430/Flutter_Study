import 'package:contraflutterkit/login/contra_text.dart';
import 'package:contraflutterkit/utils/colors.dart';
import 'package:flutter/material.dart';

import 'blog.dart';

class BlogListItem extends StatelessWidget {
  final Blog blog;
  final VoidCallback onTap;

  const BlogListItem({super.key, required this.blog, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(top: 24),
        padding: const EdgeInsets.all(24),
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                width: 100,
                height: 100,
                decoration: ShapeDecoration(
                    color: blog.bgColor,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                        side: BorderSide(color: wood_smoke, width: 2))),
//                child: SvgPicture.asset(
//                  "assets/icons/placeholder_icon.svg",
//                  width: 40,
//                  height: 40,
//                ),
                child: const Icon(
                  Icons.image,
                  color: white,
                  size: 40,
                ),
              ),
            ),
            const SizedBox(
              width: 24,
            ),
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    "12 March, 20",
                    style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        color: trout),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    blog.title,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: wood_smoke,
                        fontSize: 21),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  const Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.chat_bubble_outline,
                              color: wood_smoke,
                            ),
                            ContraText(
                              text: "Comment",
                              size: 13,
                              alignment: Alignment.center,
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.favorite_border,
                              color: wood_smoke,
                            ),
                            ContraText(
                              text: "Like",
                              size: 13,
                              alignment: Alignment.center,
                            )
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
