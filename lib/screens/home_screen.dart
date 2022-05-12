import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mais_receitas/controller/check_favorite.dart';
import 'package:mais_receitas/controller/home_controller.dart';
import 'package:mais_receitas/screens/recipes_screen.dart';
import 'package:mais_receitas/widgets/drawer.dart';
import 'package:mais_receitas/widgets/image_container.dart';
import 'package:mais_receitas/widgets/my_circular_progress_indicator.dart';
import 'package:mais_receitas/widgets/my_sliver_app_bar.dart';

import '../design/my_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Box<String> favoriteRecipeBox;
  late String userId;

  final homeController = HomeController();
  final loading = ValueNotifier(true);

  @override
  void initState() {
    setState(() {
      homeController.start();
      // loadReceitas();
    });
    favoriteRecipeBox = Hive.box("favoriteBox2");
    userId = favoriteRecipeBox.values.first;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      backgroundColor: Colors.transparent,
      body: FutureBuilder(
        future: homeController.start(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Stack(
              children: [
                const ImageContainer(assetImage: 'lib/images/background.png'),
                CustomScrollView(
                  slivers: <Widget>[
                    const MySliverAppBar(),
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
                        return Card(
                          color: MyColors.primarylight,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          elevation: 0,
                          child: InkWell(
                            onTap: () async {
                              if (await checkFavorite(homeController
                                      .allRecipesName.recipesName![index]) ==
                                  true) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: ((context) => RecipesScreen(
                                          recipesName: homeController
                                              .allRecipesName
                                              .recipesName![index],
                                          isFavorited: true,
                                        )),
                                  ),
                                );
                              }
                              if (await checkFavorite(homeController
                                      .allRecipesName.recipesName![index]) ==
                                  false) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: ((context) => RecipesScreen(
                                          recipesName: homeController
                                              .allRecipesName
                                              .recipesName![index],
                                          isFavorited: false,
                                        )),
                                  ),
                                );
                              }
                            },
                            splashColor: MyColors.primarydark,
                            child: ListTile(
                              title: Text(
                                homeController
                                    .allRecipesName.recipesName![index],
                                style: TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  color: MyColors.primarydark,
                                  fontFamily: GoogleFonts.ptSerif().fontFamily,
                                  fontSize: 18,
                                ),
                                maxLines: 1,
                              ),
                              leading: const ImageContainer(
                                assetImage: "lib/images/lead_icon.png",
                                height: 32,
                                width: 32,
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ],
                ),
              ],
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
          return const MyCircularProgressIndicator();
        }),
      ),
    );
  }
}
