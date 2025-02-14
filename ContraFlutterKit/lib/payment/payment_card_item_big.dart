import 'package:contraflutterkit/custom_widgets/button_plain_with_shadow.dart';
import 'package:contraflutterkit/custom_widgets/custom_list_item.dart';
import 'package:contraflutterkit/payment/payment_type.dart';
import 'package:contraflutterkit/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PaymentCartItemBig extends StatelessWidget {
  final PaymentType type;
  final bool isVertical;

  const PaymentCartItemBig({super.key, required this.type, required this.isVertical});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: isVertical
          ? kIsWeb
              ? MediaQuery.of(context).size.height * 0.6
              : MediaQuery.of(context).size.height * 0.5
          : 250,
      margin: isVertical
          ? const EdgeInsets.symmetric(horizontal: 24, vertical: 12)
          : const EdgeInsets.only(right: 12, top: 24, bottom: 12),
      padding: const EdgeInsets.all(24),
      decoration: ShapeDecoration(
          color: type.color,
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
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            children: [
              Text(
                type.type,
                style: const TextStyle(
                    color: white, fontSize: 25, fontWeight: FontWeight.w500),
              ),
              Text(
                type.price != null ? "\$${type.price}" : "FREE",
                style: const TextStyle(
                    color: white, fontSize: 44, fontWeight: FontWeight.w800),
              ),
            ],
          ),
          isVertical
              ? CustomListItem(
                  list: type.list,
                )
              : const Padding(
                  padding: EdgeInsets.symmetric(vertical: 24.0),
                  child: Text(
                    "You don’t think you should give some dollar to use our service.",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: white, fontSize: 17),
                  ),
                ),
          ButtonPlainWithShadow(
            text: "Select",
            height: 48,
            shadowColor: type.buttonColor,
            color: type.buttonColor,
            callback: () {},
            textColor: type.buttonTextColor,
            borderColor: type.buttonColor,
          ),
        ],
      ),
    );
  }
}
