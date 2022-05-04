import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mais_receitas/design/my_colors.dart';
import 'package:mais_receitas/widgets/ingredient_card.dart';
import 'package:mais_receitas/widgets/method_card.dart';

class RecipesPage extends StatefulWidget {
  const RecipesPage({Key? key}) : super(key: key);

  @override
  State<RecipesPage> createState() => _RecipesPageState();
}

class _RecipesPageState extends State<RecipesPage> {
  late ScrollController _scrollController;

  int _currentIndex = 0;
  List cardList = [const MethodCard(), const IngredientCard()];
  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
    // setFormAction(true);
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
                decoration:const  BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("lib/images/background.png"),fit: BoxFit.fill,
      
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        const Text(
                          "123456",
                        ),
                      ],
                    ),
                  ),
                  CarouselSlider(
                    options: CarouselOptions(
                      enlargeCenterPage: true,
                      height: 354.0,
                      viewportFraction: 1.0,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _currentIndex = index;
                        });
                      },
                    ),
                    items: cardList.map((card) {
                      return Builder(builder: (BuildContext context) {
                        return Container(
                          decoration: const BoxDecoration(
                            color: MyColors.primarylight,
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: card,
                          ),
                        );
                      });
                    }).toList(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: map<Widget>(cardList, (index, url) {
                      return Container(
                        width: 10.0,
                        height: 10.0,
                        margin: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 2.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _currentIndex == index
                              ? Colors.white
                              : MyColors.primarydark,
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
