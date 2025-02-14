import 'package:contraflutterkit/custom_widgets/circle_dot_widget.dart';
import 'package:contraflutterkit/shopping/category_item.dart';
import 'package:contraflutterkit/shopping/shopping_card_pager_item.dart';
import 'package:contraflutterkit/utils/colors.dart';
import 'package:flutter/cupertino.dart';

class ShoppingCardPager extends StatefulWidget {
  const ShoppingCardPager({super.key});

  @override
  _ShoppingCardPagerState createState() => _ShoppingCardPagerState();
}

class _ShoppingCardPagerState extends State<ShoppingCardPager> {
  late PageController _pageController;
  int currentPageValue = 0;
  int previousPageValue = 0;
  double _moveBar = 0.0;
  final List<Widget> _cards = [
    const ShoppingCardPagerItem(
      categoryBig: CategoryBig(
          bgColor: lightening_yellow,
          startColor: lightening_yellow,
          name: "Summer \nCollection",
          image: "assets/images/shopping/peep_glass.svg"),
    ),
    const ShoppingCardPagerItem(
      categoryBig: CategoryBig(
          bgColor: lightening_yellow,
          startColor: lightening_yellow,
          name: "Tee \nShirts",
          image: "assets/images/shopping/peep_glass.svg"),
    ),
    const ShoppingCardPagerItem(
      categoryBig: CategoryBig(
          bgColor: lightening_yellow,
          startColor: lightening_yellow,
          name: "Formal \nPants",
          image: "assets/images/shopping/peep_glass.svg"),
    )
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: currentPageValue);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 180,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: PageView.builder(
            physics: const ClampingScrollPhysics(),
            itemBuilder: (context, index) {
              return _cards[index];
            },
            onPageChanged: (int page) {
              animatePage(page);
            },
            itemCount: _cards.length,
            controller: _pageController,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              for (int i = 0; i < _cards.length; i++)
                if (i == currentPageValue) ...[
                  const CircleDotWidget(
                    isActive: true,
                    color: flamingo,
                    borderColor: flamingo,
                  )
                ] else
                  const CircleDotWidget(
                    isActive: false,
                    color: white,
                    borderColor: wood_smoke,
                  ),
            ],
          ),
        ),
      ],
    );
  }

  void animatePage(int page) {
    print('page is $page');

    currentPageValue = page;

    if (previousPageValue == 0) {
      previousPageValue = currentPageValue;
      _moveBar = _moveBar + 0.14;
    } else {
      if (previousPageValue < currentPageValue) {
        previousPageValue = currentPageValue;
        _moveBar = _moveBar + 0.14;
      } else {
        previousPageValue = currentPageValue;
        _moveBar = _moveBar - 0.14;
      }
    }

    setState(() {});
  }
}
