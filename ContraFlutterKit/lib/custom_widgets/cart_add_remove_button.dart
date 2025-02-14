import 'package:contraflutterkit/utils/colors.dart';
import 'package:flutter/material.dart';

class CartAddRemoveButton extends StatefulWidget {
  const CartAddRemoveButton({super.key});

  @override
  _CartAddRemoveButtonState createState() => _CartAddRemoveButtonState();
}

class _CartAddRemoveButtonState extends State<CartAddRemoveButton> {
  late int count;

  @override
  void initState() {
    super.initState();
    count = 0;
  }

  void onAddClicked() {
    if (count < 4) {
      setState(() {
        count = count + 1;
        print("add clicked $count");
      });
    }
  }

  void onRemoveClicked() {
    if (count > 0) {
      setState(() {
        count = count - 1;
        print("remove clicked $count");
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 96,
      height: 40,
      decoration: const ShapeDecoration(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              side: BorderSide(color: wood_smoke, width: 2))),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          count == 0
              ? const SizedBox()
              : Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: () {
                      onRemoveClicked();
                    },
                    child: IconButton(
                      icon: const Icon(
                        Icons.remove,
                        size: 24,
                      ),
                      onPressed: () {
                        onRemoveClicked();
                      },
                    ),
                  ),
                ),
          count == 0
              ? Expanded(
                  flex: 2,
                  child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      alignment: Alignment.center,
                      height: MediaQuery.of(context).size.height,
                      decoration: const ShapeDecoration(
                        color: lightening_yellow,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomLeft: Radius.circular(10))),
                      ),
                      child: const Text(
                        "Add",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: wood_smoke,
                            fontWeight: FontWeight.w800,
                            fontSize: 18),
                      )))
              : Expanded(
                  flex: 1,
                  child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      alignment: Alignment.center,
                      height: MediaQuery.of(context).size.height,
                      color: lightening_yellow,
                      child: Text(
                        count.toString(),
                        style: const TextStyle(
                            color: wood_smoke,
                            fontWeight: FontWeight.w800,
                            fontSize: 18),
                      ))),
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: () {
                onAddClicked();
              },
              child: IconButton(
                icon: const Icon(
                  Icons.add,
                  size: 24,
                ),
                onPressed: () {
                  onAddClicked();
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
