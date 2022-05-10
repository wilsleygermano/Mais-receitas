import 'dart:async';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mais_receitas/controller/favorite_button_pressed.dart';
import 'package:mais_receitas/controller/get_recipe.dart';
import 'package:mais_receitas/data/recipe_model.dart';
import 'package:mais_receitas/data/user_model.dart';
import 'package:mais_receitas/design/my_colors.dart';


class MethodCard extends StatefulWidget {
  final UserModel user;
  final String recipeName;

  const MethodCard({
    required this.recipeName,
    Key? key, required this.user,
  }) : super(key: key);

  @override
  State<MethodCard> createState() => _MethodCardState();
}

class _MethodCardState extends State<MethodCard> {
  final dataBase = FirebaseFirestore.instance;
  late String recipeTitle;
  late Map<String, dynamic> favoritedRecipe = {};
  late StreamSubscription<DocumentSnapshot> subscription;
  late DocumentReference documentReference;


  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Card(
      color: MyColors.primarylight,
      elevation: 0,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Container(
                    alignment: Alignment.topLeft,
                    child: AutoSizeText(
                      widget.recipeName,
                      style: TextStyle(
                        color: MyColors.primarydark,
                        fontFamily: GoogleFonts.ptSerif().fontFamily,
                        fontSize: 24,
                      ),
                      maxLines: 1,
                    ),
                  ),
                ),
                FavoriteButton(
                  iconSize: 50,
                  isFavorite: false,
                  iconColor: Colors.deepPurple,
                  valueChanged: (_isFavorite) async {
                    await favoriteButtonPressed(recipeTitle, favoritedRecipe, widget.user.email.toString());
                  },
                ),
              ],
            ),
            Container(
              alignment: Alignment.topLeft,
              child: Text(
                "Ingredientes:",
                style: TextStyle(
                  color: MyColors.primarydark,
                  fontFamily: GoogleFonts.ptSerif().fontFamily,
                  fontSize: 12,
                ),
              ),
            ),
            FutureBuilder<RecipeModel?>(
              future: getRecipe(widget.recipeName),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  recipeTitle = "${snapshot.data!.recipes!.nome}";
                  favoritedRecipe.addAll({
                    "recipeName": "${snapshot.data!.recipes!.nome}",
                    "method": "${snapshot.data!.recipes!.preparo}",
                    "ingredients":
                        "${snapshot.data!.recipes!.ingredientes}",
                  });
                  return ListView.builder(
                    itemCount:
                        snapshot.data!.recipes!.ingredientes!.length,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 0,
                        child: ListTile(
                          title: Text(snapshot
                              .data!.recipes!.ingredientes![index]),
                          tileColor: MyColors.primarylight,
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
                      );
                    },
                  );
                }
                if (snapshot.hasError) {
                  return Dialog(
                    backgroundColor: Colors.white,
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: ElevatedButton(
                      child: const Text("Try again"),
                      onPressed: () {
                        // setState(
                        //   () {
                        //     recipe;
                        //   },
                        // );
                      },
                    ),
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.purple,
                    strokeWidth: 8.0,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
