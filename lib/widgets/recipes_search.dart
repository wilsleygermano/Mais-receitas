import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mais_receitas/controller/check_favorite.dart';
import 'package:mais_receitas/controller/home_controller.dart';
import 'package:mais_receitas/data/recipes_name_model.dart';
import 'package:mais_receitas/design/my_colors.dart';
import 'package:mais_receitas/screens/recipes_screen.dart';

class RecipesSearch extends SearchDelegate<RecipesNameModel> {
  final List<String> recipesList;
  final Future<void> future;
  final HomeController controller;

  RecipesSearch(this.recipesList, this.future, this.controller);

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(
          Icons.clear,
          color: MyColors.primarydark,
        ),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, RecipesNameModel());
      },
      icon: const Icon(
        Icons.arrow_back,
        color: MyColors.primarydark,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            final results = controller.allRecipesName.recipesName!
                .where((a) => a.toLowerCase().contains(query));
            return ListView(
              children: results
                  .map<Card>((a) => Card(
                        color: MyColors.primarylight,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        elevation: 0,
                        child: InkWell(
                          onTap: () async {
                            if (await checkFavorite(a) == true) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: ((context) => RecipesScreen(
                                        recipesName: a,
                                        isFavorited: true,
                                      )),
                                ),
                              );
                            }
                            if (await checkFavorite(a) == false) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: ((context) => RecipesScreen(
                                        recipesName: a,
                                        isFavorited: false,
                                      )),
                                ),
                              );
                            }
                          },
                          splashColor: MyColors.primarydark,
                          child: ListTile(
                            title: Text(
                              a,
                              style: TextStyle(
                                overflow: TextOverflow.ellipsis,
                                color: MyColors.primarydark,
                                fontFamily: GoogleFonts.ptSerif().fontFamily,
                                fontSize: 18,
                              ),
                              maxLines: 1,
                            ),
                            leading: Container(
                              height: 32,
                              width: 34,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("lib/images/lead_icon.png"),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ))
                  .toList(),
            );
          }
          if (snapshot.connectionState == ConnectionState.none) {
            return const Center(
              child: Text("Something went wrong"),
            );
          }
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.purple,
              strokeWidth: 8.0,
            ),
          );
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            final results = controller.allRecipesName.recipesName!
                .where((a) => a.toLowerCase().contains(query));
            return ListView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              shrinkWrap: true,
              children: results
                  .map<Card>((a) => Card(
                        color: MyColors.primarylight,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        elevation: 0,
                        child: InkWell(
                          onTap: () async {
                            if (await checkFavorite(a) == true) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: ((context) => RecipesScreen(
                                        recipesName: a,
                                        isFavorited: true,
                                      )),
                                ),
                              );
                            }
                            if (await checkFavorite(a) == false) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: ((context) => RecipesScreen(
                                        recipesName: a,
                                        isFavorited: false,
                                      )),
                                ),
                              );
                            }
                          },
                          splashColor: MyColors.primarydark,
                          child: ListTile(
                            title: Text(
                              a,
                              style: TextStyle(
                                overflow: TextOverflow.ellipsis,
                                color: MyColors.primarydark,
                                fontFamily: GoogleFonts.ptSerif().fontFamily,
                                fontSize: 18,
                              ),
                              maxLines: 1,
                            ),
                            leading: Container(
                              height: 32,
                              width: 34,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("lib/images/lead_icon.png"),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ))
                  .toList(),
            );
          }
          if (snapshot.connectionState == ConnectionState.none) {
            return const Center(
              child: Text("Something went wrong"),
            );
          }
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.purple,
              strokeWidth: 8.0,
            ),
          );
        });
  }
}
