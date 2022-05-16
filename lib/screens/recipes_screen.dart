import 'package:carousel_slider/carousel_slider.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:mais_receitas/controller/favorite_button_pressed.dart';
import 'package:mais_receitas/controller/share_content.dart';
import 'package:mais_receitas/design/my_colors.dart';
import 'package:mais_receitas/widgets/background_image.dart';
import 'package:mais_receitas/widgets/ingredient_card.dart';
import 'package:mais_receitas/widgets/logo_image.dart';
import 'package:mais_receitas/widgets/method_card.dart';
import '../widgets/return_button.dart';

class RecipesScreen extends StatefulWidget {
  final String recipesName;
  final bool? isFavorited;

  const RecipesScreen({
    required this.recipesName,
    Key? key,
    this.isFavorited,
  }) : super(key: key);

  @override
  State<RecipesScreen> createState() => _RecipesScreenState();
}

class _RecipesScreenState extends State<RecipesScreen> {
  late List cardList;
  late Map<String, dynamic> favoritedRecipe = {};
  int _currentIndex = 0;
  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  void initState() {
    cardList = <Widget>[
      MethodCard(
        recipeName: widget.recipesName,
        isFavorited: widget.isFavorited,
      ),
      IngredientCard(
        recipeName: widget.recipesName,
        isFavorited: widget.isFavorited,
      )
    ];
    favoritedRecipe.addAll({"nome": widget.recipesName});
    super.initState();
    // setFormAction(true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Center(
          child: Stack(
            children: [
              const BackgroundImage(),
              const ReturnButton(),
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const LogoImage(),
                    CarouselSlider(
                      options: CarouselOptions(
                        enableInfiniteScroll: false,
                        enlargeCenterPage: true,
                        height: 354.0,
                        viewportFraction: 1.0,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _currentIndex = index;
                          });
                        },
                      ),
                      items: cardList.map<Widget>((card) {
                        return Builder(builder: (BuildContext context) {
                          return Container(
                            //  padding: EdgeInsets.only(left: 32, right: 32),
                            decoration: const BoxDecoration(
                              color: MyColors.primarylight,
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            child: card,
                          );
                        });
                      }).toList(),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FavoriteButton(
                          iconSize: 50,
                          isFavorite: widget.isFavorited,
                          iconColor: Colors.deepPurple,
                          valueChanged: (_isFavorited) async {
                            await favoriteButtonPressed(
                                widget.recipesName, favoritedRecipe, context);
                          },
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
                                    ? Colors.deepPurple
                                    : MyColors.primarydark,
                              ),
                            );
                          }),
                        ),
                        IconButton(
                            onPressed: (() async => {
                                  shareContent(widget.recipesName),
                                }),
                            icon: const Icon(Icons.share,
                                color: MyColors.primarydark)),
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
