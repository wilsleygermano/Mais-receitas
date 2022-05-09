import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../design/my_colors.dart';
// import 'package:mais_receitas/design/my_colors.dart';

class IngredientCard extends StatelessWidget {
  const IngredientCard({Key? key}) : super(key: key);

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
                "Prato",
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
                  ListView(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: const <Widget>[
                      Card(
                        elevation: 0,
                        child: ListTile(
                          title: Text(
                            "1 - Abra o abacaxi no meio, no sentido da coroa para a base. Retire a polpa e cortar em cubos.   2- Abra o abacaxi no meio, no sentido da coroa para a base. Retire a polpa e cortar em cubos. ",
                            textAlign: TextAlign.center,
                          ),
                          tileColor: MyColors.primarylight,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
