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
            Container(
              alignment: Alignment.topLeft,
              child: Text("Prato",
                  style: TextStyle(
                    color: MyColors.primarydark,
                    fontFamily: GoogleFonts.ptSerif().fontFamily,
                    fontSize: 24,
                  )),
            ),
            Container(
                alignment: Alignment.topLeft,
                child: Text("Ingredientes:",
                    style: TextStyle(
                      color: MyColors.primarydark,
                      fontFamily: GoogleFonts.ptSerif().fontFamily,
                      fontSize: 12,
                    ))),
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
