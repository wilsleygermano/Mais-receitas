import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mais_receitas/controller/get_recipe.dart';
import 'package:mais_receitas/data/recipe_model.dart';
import 'package:mais_receitas/design/my_colors.dart';
// import 'package:mais_receitas/design/my_theme.dart';
// import 'package:mais_receitas/design/my_colors.dart';

class MethodCard extends StatefulWidget {
  final String recipeName;
  const MethodCard({required this.recipeName, Key? key}) : super(key: key);

  @override
  State<MethodCard> createState() => _MethodCardState();
}

class _MethodCardState extends State<MethodCard> {
  final dataBase = FirebaseFirestore.instance;
  // test variable - firestore
  final user = <String, dynamic>{
    "first": "Ada",
    "last": "Lovelace",
    "born": 1815
  };

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
                    [
                      print('Is Favorite : $_isFavorite'),
                      await dataBase.collection("teste").add(user).then(
                          (DocumentReference doc) => print(
                              'DocumentSnapshot added with ID: ${doc.id}'))
                    ];
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
                  return ListView.builder(
                    itemCount:
                        snapshot.data!.recipes!.secao![0].conteudo!.length,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 0,
                        child: ListTile(
                          title: Text(snapshot
                              .data!.recipes!.secao![0].conteudo![index]),
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
