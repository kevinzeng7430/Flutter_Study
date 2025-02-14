import 'dart:math' as math;

import 'package:contraflutterkit/payment/payment_type.dart';
import 'package:contraflutterkit/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PaymentCard extends StatelessWidget {
  final CardDetail card;
  final bool isVertical;
  final Color color;

  const PaymentCard(
      {super.key, required this.card, required this.isVertical, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(left: 24, right: 24, bottom: 16),
      decoration: ShapeDecoration(
          color: card.color,
          shadows: const [
            BoxShadow(
              color: wood_smoke,
              offset: Offset(
                0.0, // Move to right 10  horizontally
                2.0, // Move to bottom 5 Vertically
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
            card.type,
            style: const TextStyle(color: white, fontSize: 21),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Row(
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(right: 10),
                  width: 52,
                  height: 36,
                  decoration: const ShapeDecoration(
                      color: white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)))),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    card.number,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: const TextStyle(
                        color: white,
                        fontWeight: FontWeight.w800,
                        fontSize: 21),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    "CARD HOLDER",
                    style: TextStyle(color: white, fontSize: 12),
                  ),
                  Text(
                    card.user_name,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: const TextStyle(
                        color: white,
                        fontWeight: FontWeight.w800,
                        fontSize: 21),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 36.0),
                child: Transform.rotate(
                  angle: math.pi / 2,
                  origin: const Offset(0, 0),
                  child: SvgPicture.asset(
                    "assets/icons/logo_visa.svg",
                    color: color,
                    width: 36,
                    height: 56,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
