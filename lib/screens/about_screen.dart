import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mais_receitas/design/my_colors.dart';
import 'package:mais_receitas/widgets/return_button.dart';
import 'package:url_launcher/url_launcher.dart';

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
                          const SizedBox(height: 24,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: const [
                              ReturnButton(),
                            ],
                          ),
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
                                color: MyColors.primarydark.withOpacity(0.4),
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
                                  width: 360,
                                  height: 400,
                                  decoration: BoxDecoration(
                                    color: MyColors.primaryoriginal
                                        .withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(16.0),
                                    border: Border.all(
                                      width: 4.0,
                                      color: MyColors.primaryoriginal
                                          .withOpacity(0.5),
                                    ),
                                  ),
                                  child: Column(
                                    children: [
                                      Text(
                                        " Sobre este projeto:",
                                        style: TextStyle(
                                            fontFamily: GoogleFonts.secularOne()
                                                .fontFamily,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 24,
                                            color: const Color.fromARGB(
                                                255, 82, 70, 114)),
                                      ),
                                      const SizedBox(
                                        height: 16,
                                      ),
                                      Text(
                                        "Elaborado com amor e carinho para a SnowAcademy. ",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontFamily: GoogleFonts.secularOne()
                                                .fontFamily,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 20,
                                            color: MyColors.primarydark),
                                      ),
                                      const SizedBox(
                                        height: 42,
                                      ),
                                      Text(
                                        " Conheça mais sobre o desenvolvimento:",
                                        style: TextStyle(
                                            fontFamily: GoogleFonts.secularOne()
                                                .fontFamily,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                            color: const Color.fromARGB(
                                                255, 82, 70, 114)),
                                      ),
                                      const SizedBox(height: 24),
                                      ElevatedButton.icon(
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  MyColors.primaryoriginal),
                                          shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                          ),
                                        ),
                                        onPressed: () => launchUrl(Uri.parse(
                                            "https://github.com/LaisBonin")),
                                        icon: Image.asset(
                                          'lib/images/github_logo.png',
                                          height: 24,
                                          width: 24,
                                        ),
                                        label: Text(
                                          'https://github.com/LaisBonin',
                                          style: TextStyle(
                                            color: const Color.fromARGB(
                                                255, 82, 70, 114),
                                            fontFamily: GoogleFonts.secularOne()
                                                .fontFamily,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 12),
                                      ElevatedButton.icon(
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  MyColors.primaryoriginal),
                                          shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                          ),
                                        ),
                                        onPressed: () => launchUrl(Uri.parse(
                                            "https://github.com/wilsleygermano")),
                                        icon: Image.asset(
                                          'lib/images/github_logo.png',
                                          height: 24,
                                          width: 24,
                                        ),
                                        label: Text(
                                          'https://github.com/wilsleygermano',
                                          style: TextStyle(
                                            color: const Color.fromARGB(
                                                255, 82, 70, 114),
                                            fontFamily: GoogleFonts.secularOne()
                                                .fontFamily,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
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
