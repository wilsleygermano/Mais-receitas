import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../data/get_recipe.dart';
import '../design/my_colors.dart';
// import 'package:mais_receitas/design/my_colors.dart';

class IngredientCard extends StatefulWidget {
  final String recipeName;
  const IngredientCard({required this.recipeName, Key? key}) : super(key: key);

  @override
  State<IngredientCard> createState() => _IngredientCardState();
}

class _IngredientCardState extends State<IngredientCard> {
  @override
  Widget build(BuildContext context) {
    
    return Card(
      color: MyColors.primarylight,
      elevation: 0,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
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

            Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Modo de Preparo:",
                      style: TextStyle(
                        color: MyColors.primarydark,
                        fontFamily: GoogleFonts.ptSerif().fontFamily,
                        fontSize: 12,
                      ),
                    ),
                  ),
                 FutureBuilder<Recipe?>(
              future: getRecipe(widget.recipeName),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data!.recipes!.secao![1].conteudo!.length,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 0,
                        child: ListTile(
                          title: Text(
                              snapshot.data!.recipes!.secao![1].conteudo![index]),
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
                 
                 
                 
                 
                 
                 
                  // ListView(
                  //   physics: const NeverScrollableScrollPhysics(),
                  //   shrinkWrap: true,
                  //   children: const <Widget>[
                  //     Card(
                  //       elevation: 0,
                  //       child: ListTile(
                  //         title: Text(
                  //           "1 - Abra o abacaxi no meio, no sentido da coroa para a base. Retire a polpa e cortar em cubos.   2- Abra o abacaxi no meio, no sentido da coroa para a base. Retire a polpa e cortar em cubos. ",
                  //           textAlign: TextAlign.center,
                  //         ),
                  //         tileColor: MyColors.primarylight,
                  //       ),
                  //     ),
                  //   ],
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
