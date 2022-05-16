import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mais_receitas/controller/home_controller.dart';
import 'package:mais_receitas/data/user_model.dart';
import 'package:mais_receitas/design/my_colors.dart';
import 'package:mais_receitas/screens/login_screen.dart';
import 'package:mais_receitas/screens/recipes_screen.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        top: false,
        child: FutureBuilder(
          
          builder: ((context, snapshot) {
            {
              return Center(
                child: Stack(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('lib/images/background.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 300,
                                width: 300,
                                alignment: Alignment.topCenter,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage('lib/images/logo.png'),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            decoration: BoxDecoration(boxShadow: [
                              BoxShadow(
                                blurRadius: 16,
                                spreadRadius: 16,
                                color: Colors.black.withOpacity(0.2),
                              )
                            ]),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16.0),
                              child: BackdropFilter(
                                filter: ImageFilter.blur(
                                  sigmaX: 50.0,
                                  sigmaY: 50.0,
                                ),
                                child: Container(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 20, 20, 20),
                                  margin:
                                      const EdgeInsets.fromLTRB(10, 10, 10, 10),
                                  // width: 360,
                                  height: 200,
                                  decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(16.0),
                                      border: Border.all(
                                        width: 2.0,
                                        color: Colors.white.withOpacity(0.2),
                                      )),
                                  child: Scrollbar(
                                    isAlwaysShown: false,
                                    scrollbarOrientation:
                                        ScrollbarOrientation.left,
                                    child: Column(
                                      children: [
                                        Text(
                                          " Sobre este projeto:",
                                          style: TextStyle(
                                              fontFamily:
                                                  GoogleFonts.secularOne()
                                                      .fontFamily,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 24,
                                              color: MyColors.primarydark),
                                        ),
                                        const SizedBox(
                                          height: 12,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 32),
                          InkWell(
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }
          }),
        ),
      ),
    );
  }
}
