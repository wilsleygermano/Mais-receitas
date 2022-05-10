import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:mais_receitas/design/my_colors.dart';

class BottomBar extends StatefulWidget {
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _page = 0;
  GlobalKey<CurvedNavigationBarState> _bottomBarKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      key: _bottomBarKey,
      index: 0,
      height: 60.0,
      items: const <Widget>[
        Icon(
          Icons.favorite_border,
          size: 30,
        ),
        Icon(Icons.shuffle, size: 30),
        Icon(Icons.search, size: 30),
        Icon(Icons.logout_outlined, size: 30),
      ],
      color: MyColors.primaryoriginal,
      buttonBackgroundColor: MyColors.primarydark,
      backgroundColor: MyColors.primarylight,
      animationCurve: Curves.easeInOut,
      animationDuration: Duration(milliseconds: 600),
      onTap: (index) {
        setState(() {
          _page = index;
        });
      },
      letIndexChange: (index) => true,
    );
  }
}
