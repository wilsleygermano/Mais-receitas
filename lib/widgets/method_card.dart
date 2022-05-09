import 'package:auto_size_text/auto_size_text.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mais_receitas/design/my_colors.dart';
import 'package:mais_receitas/design/my_theme.dart';
// import 'package:mais_receitas/design/my_colors.dart';

class MethodCard extends StatelessWidget {
  const MethodCard({Key? key}) : super(key: key);

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
                      "Pizza de Hamburquibe  ",
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
                  isFavorite: true,
                  iconColor: Colors.deepPurple,
                  valueChanged: (_isFavorite) {
                    print('Is Favorite : $_isFavorite');
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
            ListView(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: <Widget>[
                Card(
                  elevation: 0,
                  child: ListTile(
                    title: const Text("200 g de polvo em pedaços"),
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
                ),
                Card(
                  elevation: 0,
                  child: ListTile(
                    title: const Text("200 g de polvo em pedaços"),
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
                ),
                Card(
                  elevation: 0,
                  child: ListTile(
                    title: const Text("200 g de polvo em pedaços"),
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
                ),
                Card(
                  elevation: 0,
                  child: ListTile(
                    title: const Text("200 g de polvo em pedaços"),
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
                ),
                Card(
                  elevation: 0,
                  child: ListTile(
                    title: const Text("200 g de polvo em pedaços"),
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
                ),
                Card(
                  elevation: 0,
                  child: ListTile(
                    title: const Text("200 g de polvo em pedaços"),
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
                ),
                Card(
                  elevation: 0,
                  child: ListTile(
                    title: const Text("200 g de polvo em pedaços"),
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
                ),
                Card(
                  elevation: 0,
                  child: ListTile(
                    title: const Text("200 g de polvo em pedaços"),
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
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
