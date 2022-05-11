import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mais_receitas/data/favorite_model.dart';
import 'package:mais_receitas/design/my_colors.dart';
import 'package:mais_receitas/screens/recipes_screen.dart';

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
                    MySliverAppBar(),
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                          return Card(
                            color: MyColors.primarylight,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            elevation: 0,
                            child: InkWell(
                              onTap: () async {
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
                              splashColor: MyColors.primarydark,
                              child: ListTile(
                                title: Text(
                                  snapshot.data![index].nome!,
                                  style: TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    color: MyColors.primarydark,
                                    fontFamily:
                                        GoogleFonts.ptSerif().fontFamily,
                                    fontSize: 18,
                                  ),
                                  maxLines: 1,
                                ),
                                leading: Container(
                                  height: 32,
                                  width: 34,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                          "lib/images/lead_icon.png"),
                                    ),
                                  ),
                                ),
                              ),
                            ),
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
            showDialog(
              context: context,
              builder: (context) {
                return Dialog(
                  backgroundColor: Colors.white,
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: ElevatedButton(
                    child: const Text("Something went wrong, please try again later"),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                );
              },
            );
          }
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.purple,
              strokeWidth: 8.0,
            ),
          );
        }),
      ),
    );
  }
}
