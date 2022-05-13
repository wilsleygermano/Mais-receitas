import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mais_receitas/classes/my_dialog.dart';
import 'package:mais_receitas/data/favorite_model.dart';
import 'package:mais_receitas/screens/no_favorite_screen.dart';
import 'package:mais_receitas/screens/recipes_screen.dart';
import 'package:mais_receitas/widgets/list_card.dart';
import 'package:mais_receitas/widgets/my_circular_progress_indicator.dart';

import '../widgets/my_sliver_app_bar.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  late Box<String> favoriteRecipeBox;
  late String? userId;
  late List<FavoritesModel> recipesList;

  @override
  void initState() {
    favoriteRecipeBox = Hive.box("favoriteBox2");
    userId = favoriteRecipeBox.get("id");
    getFavRecipes();
    super.initState();
  }

  Stream<List<FavoritesModel>> getFavRecipes() async* {
    recipesList = [];
    if (userId != null) {
      final docs = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .collection("favorite_recipes")
          .get();
      recipesList =
          docs.docs.map((e) => FavoritesModel.fromJson(e.data())).toList();

      yield recipesList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: StreamBuilder<List<FavoritesModel>>(
        stream: getFavRecipes(),
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            return Stack(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('lib/images/background.png'),
                        fit: BoxFit.fill),
                  ),
                ),
                CustomScrollView(
                  slivers: <Widget>[
                    const MySliverAppBar(),
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                          return ListCard(
                            titleText: snapshot.data![index].nome!,
                            cardPressed: () async {
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: ((context) => RecipesScreen(
                                        recipesName:
                                            snapshot.data![index].nome!,
                                      )),
                                ),
                              );
                            },
                          );
                        },
                        childCount: recipesList.length,
                      ),
                    ),
                  ],
                ),
              ],
            );
          }
          if (snapshot.hasError) {
            myDialog(context, "ERRO", "Algo deu errado", "OK",
                () => Navigator.pop(context));
          }
          if (!snapshot.hasData) {
            return const NoFavoriteScreen();
          }
          return const MyCircularProgressIndicator();
        }),
      ),
    );
  }
}
