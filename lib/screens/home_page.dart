import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mais_receitas/controller/home_controller.dart';

import '../design/my_colors.dart';
import '../widgets/bottom_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homeController = HomeController();

  @override
  void initState() {
    setState(() {
      homeController.start();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      bottomNavigationBar: BottomBar(),
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
              FutureBuilder(
                future: homeController.start(),
                builder: ((context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return Scrollbar(
                      isAlwaysShown: false,
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: homeController.allRecipesName.recipesName!
                              .sublist(0, 20)
                              .length,
                          itemBuilder: (context, index) {
                            return Card(
                              color: MyColors.primarylight,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              elevation: 0,
                              child: InkWell(
                                onTap: () {},
                                splashColor: MyColors.primarydark,
                                child: ListTile(
                                  title: Text(
                                    "${homeController.allRecipesName.recipesName![index]}",
                                    style: TextStyle(
                                      overflow:TextOverflow.ellipsis,
                                      color: MyColors.primarydark,
                                      fontFamily:
                                          GoogleFonts.ptSerif().fontFamily,
                                      fontSize: 18,
                                    ),
                                    maxLines: 1,
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
                            );
                          }),
                    );
                  }
                  if (snapshot.connectionState == ConnectionState.none) {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return Dialog(
                          backgroundColor: Colors.white,
                          elevation: 8,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: ElevatedButton(
                            child: const Text("Try again"),
                            onPressed: () {
                              setState(
                                () {
                                  homeController.start();
                                },
                              );
                            },
                          ),
                        );
                      },
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.purple,
                      strokeWidth: 8.0,
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
