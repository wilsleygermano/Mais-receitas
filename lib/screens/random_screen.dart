import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mais_receitas/controller/home_controller.dart';
import 'package:mais_receitas/data/user_model.dart';
import 'package:mais_receitas/design/my_colors.dart';
import 'package:mais_receitas/screens/login_screen.dart';
import 'package:mais_receitas/screens/recipes_screen.dart';
import 'package:mais_receitas/widgets/main_button.dart';
import 'package:mais_receitas/widgets/page_viewer.dart';

class RandomScreen extends StatefulWidget {


  const RandomScreen({Key? key,}) : super(key: key);

  @override
  State<RandomScreen> createState() => _RandomScreenState();
}

class _RandomScreenState extends State<RandomScreen> {
  final homeController = HomeController();
  final loading = ValueNotifier(true);

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
      body: SafeArea(
        top: false,
        child: FutureBuilder(
          future: homeController.start(),
          builder: ((context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
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
                          const SizedBox(height: 32),
                          InkWell(
                            onTap: () {
                              homeController.allRecipesName.recipesName!
                                  .shuffle();
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: ((context) => RecipesScreen(
                                        recipesName: homeController
                                            .allRecipesName.recipesName![0],
                                      )),
                                ),
                              );
                            },
                            child: Container(
                              height: 300,
                              width: 300,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("lib/images/quetal.gif"),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
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
      ),
    );
  }
}
