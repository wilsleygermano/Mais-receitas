import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mais_receitas/screens/login_screen.dart';
import 'package:mais_receitas/widgets/main_button.dart';
import 'package:mais_receitas/widgets/page_viewer.dart';

import '../controller/home_controller.dart';

class RandomScreen extends StatefulWidget {
  const RandomScreen({Key? key}) : super(key: key);

  @override
  State<RandomScreen> createState() => _RandomScreenState();
}

final PageController controller = PageController(
  initialPage: 0,
  keepPage: true,
);
final homeController = HomeController();
final loading = ValueNotifier(true);
String randomRecipeName = "";
int _page = 0;

class _RandomScreenState extends State<RandomScreen> {
  Widget buildPageView() {
    return PageView(
      controller: controller,
      onPageChanged: (index) {
        pageChanged(index);
      },
    );
  }

  void pageChanged(int index) {
    setState(
      () {
        if (index == 1) {
          homeController.allRecipesName.recipesName!.shuffle();
          randomRecipeName = homeController.allRecipesName.recipesName![0];
        }
        _page = index;
      },
    );
  }

  @override
  void initState() {
    setState(() {
      homeController.start();
      homeController.allRecipesName.recipesName!.shuffle();
      randomRecipeName = homeController.allRecipesName.recipesName![0];
      // loadReceitas();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Center(
          child: Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('lib/images/background.png'),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 268,
                          width: 237,
                          alignment: Alignment.topCenter,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('lib/images/logo.png'),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 150,
                          width: 150,
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                            image: AssetImage('lib/images/random.gif'),
                            fit: BoxFit.fill,
                          )),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
