import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mais_receitas/screens/login_screen.dart';
import 'package:mais_receitas/widgets/main_button.dart';
import 'package:mais_receitas/widgets/page_viewer.dart';



class RandomScreen extends StatelessWidget {
  

  const RandomScreen({Key? key}) : super(key: key);

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
                    fit: BoxFit.fill,
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
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
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 300,
                          width: 300,
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                            image: AssetImage('lib/images/random.gif'),
                            fit: BoxFit.fill,
                          )),
                        ),
                      ],
                    ),
                   
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
