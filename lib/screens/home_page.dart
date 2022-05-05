import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../design/my_colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Center(
          child: Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('lib/images/background.png'),
                      fit: BoxFit.fill),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 268,
                        width: 237,
                        alignment: Alignment.topCenter,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('lib/images/logo.png'),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          ListView(
                            physics: const ScrollPhysics(),
                            shrinkWrap: true,
                            children: <Widget>[
                              Card(
                                color: MyColors.primarylight,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                elevation: 0,
                                child: ListTile(
                                  title:  Text(
                                    "Pizza",
                                    textAlign:TextAlign.center,
                                    style: TextStyle(
                                      color: MyColors.primarydark,
                                      fontFamily:
                                          GoogleFonts.ptSerif().fontFamily,
                                      fontSize: 24,
                                    ),
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
                              Card(
                                color: MyColors.primarylight,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                elevation: 0,
                                child: ListTile(
                                  title:  Text(
                                    "Pizza de Hamburquibe com Pizza",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign:TextAlign.center,
                                    style: TextStyle(
                                      color: MyColors.primarydark,
                                      fontFamily:
                                          GoogleFonts.ptSerif().fontFamily,
                                      fontSize: 24,
                                    ),
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
                              Card(
                                color: MyColors.primarylight,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                elevation: 0,
                                child: ListTile(
                                  title:  Text(
                                    "Pizza",
                                    style: TextStyle(
                                      color: MyColors.primarydark,
                                      fontFamily:
                                          GoogleFonts.ptSerif().fontFamily,
                                      fontSize: 24,
                                    ),
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
                              Card(
                                color: MyColors.primarylight,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                elevation: 0,
                                child: ListTile(
                                  title:  Text(
                                    "Pizza",
                                    style: TextStyle(
                                      color: MyColors.primarydark,
                                      fontFamily:
                                          GoogleFonts.ptSerif().fontFamily,
                                      fontSize: 24,
                                    ),
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
                              Card(
                                color: MyColors.primarylight,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                elevation: 0,
                                child: ListTile(
                                  title:  Text(
                                    "Pizza",
                                    style: TextStyle(
                                      color: MyColors.primarydark,
                                      fontFamily:
                                          GoogleFonts.ptSerif().fontFamily,
                                      fontSize: 24,
                                    ),
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
                              Card(
                                color: MyColors.primarylight,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                elevation: 0,
                                child: ListTile(
                                  title:  Text(
                                    "Pizza",
                                    style: TextStyle(
                                      color: MyColors.primarydark,
                                      fontFamily:
                                          GoogleFonts.ptSerif().fontFamily,
                                      fontSize: 24,
                                    ),
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
                              Card(
                                color: MyColors.primarylight,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                elevation: 0,
                                child: ListTile(
                                  title:  Text(
                                    "Pizza",
                                    style: TextStyle(
                                      color: MyColors.primarydark,
                                      fontFamily:
                                          GoogleFonts.ptSerif().fontFamily,
                                      fontSize: 24,
                                    ),
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
                              Card(
                                elevation: 0,
                                child: ListTile(
                                  title:  Text(
                                    "Pizza",
                                    style: TextStyle(
                                      color: MyColors.primarydark,
                                      fontFamily:
                                          GoogleFonts.ptSerif().fontFamily,
                                      fontSize: 24,
                                    ),
                                  ),
                                  tileColor: MyColors.primarylight,
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
                              Card(
                                color: MyColors.primarylight,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                elevation: 0,
                                child: ListTile(
                                  title:  Text(
                                    "Pizza",
                                    style: TextStyle(
                                      color: MyColors.primarydark,
                                      fontFamily:
                                          GoogleFonts.ptSerif().fontFamily,
                                      fontSize: 24,
                                    ),
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
                              Card(
                                color: MyColors.primarylight,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                elevation: 0,
                                child: ListTile(
                                  title:  Text(
                                    "Pizza",
                                    style: TextStyle(
                                      color: MyColors.primarydark,
                                      fontFamily:
                                          GoogleFonts.ptSerif().fontFamily,
                                      fontSize: 24,
                                    ),
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
                              Card(
                                color: MyColors.primarylight,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                elevation: 0,
                                child: ListTile(
                                  title:  Text(
                                    "Pizza",
                                    style: TextStyle(
                                      color: MyColors.primarydark,
                                      fontFamily:
                                          GoogleFonts.ptSerif().fontFamily,
                                      fontSize: 24,
                                    ),
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
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
