import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mais_receitas/controller/home_controller.dart';
import 'package:mais_receitas/screens/favorite_screen.dart';
import 'package:mais_receitas/screens/home_screen.dart';
import 'package:mais_receitas/screens/random_screen.dart';

import '../design/my_colors.dart';

class PageViewer extends StatefulWidget {

  const PageViewer({Key? key,}) : super(key: key);

  @override
  State<PageViewer> createState() => _PageViewerState();
}

class _PageViewerState extends State<PageViewer> {
  final homeController = HomeController();
  final loading = ValueNotifier(true);
  int _page = 0;

  final PageController controller = PageController(
    initialPage: 0,
    keepPage: true,
  );

  Widget buildPageView() {
    return PageView(
      controller: controller,
      onPageChanged: (index) {
        pageChanged(index);
      },
      children: <Widget>[
        HomeScreen(),
        RandomScreen(),
        FavoriteScreen(),
      ],
    );
  }

  void pageChanged(int index) {
    setState(
      () {
        _page = index;
      },
    );
  }

  void bottomTapped(int index) {
    setState(
      () {
        _page = index;
        controller.animateToPage(index,
            duration: const Duration(milliseconds: 500), curve: Curves.ease);
      },
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        bottomNavigationBar: CurvedNavigationBar(
          index: _page,
          height: 60.0,
          items: const <Widget>[
            Icon(Icons.home_outlined, size: 30,color: Color.fromARGB(255, 100, 85, 139),),
            Icon(Icons.shuffle, size: 30,color: Color.fromARGB(255, 100, 85, 139),),
            Icon(Icons.favorite_border, size: 30,color:Color.fromARGB(255, 100, 85, 139),),
          ],
          color: MyColors.primaryoriginal,
          buttonBackgroundColor: MyColors.primarydark,
          backgroundColor: MyColors.primarylight,
          animationCurve: Curves.easeInOut,
          animationDuration: const Duration(milliseconds: 600),
          onTap: (index) {
            bottomTapped(index);
          },
          letIndexChange: (index) => true,
        ),
        body: buildPageView());
  }
}
