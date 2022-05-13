import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mais_receitas/classes/my_dialog.dart';
import 'package:mais_receitas/controller/check_favorite.dart';
import 'package:mais_receitas/controller/home_controller.dart';
import 'package:mais_receitas/screens/recipes_screen.dart';
import 'package:mais_receitas/widgets/drawer.dart';
import 'package:mais_receitas/widgets/image_container.dart';
import 'package:mais_receitas/widgets/list_card.dart';
import 'package:mais_receitas/widgets/my_circular_progress_indicator.dart';
import 'package:mais_receitas/widgets/my_sliver_app_bar.dart';

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
                        return ListCard(
                          titleText:
                              homeController.allRecipesName.recipesName![index],
                          cardPressed: () async {
                            if (await checkFavorite(homeController
                                    .allRecipesName.recipesName![index]) ==
                                true) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: ((context) => RecipesScreen(
                                        recipesName: homeController
                                            .allRecipesName.recipesName![index],
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
                                            .allRecipesName.recipesName![index],
                                        isFavorited: false,
                                      )),
                                ),
                              );
                            }
                          },
                        );
                      }),
                    ),
                  ],
                ),
              ],
            );
          }
          if (snapshot.connectionState == ConnectionState.none) {
            myDialog(
              context,
              "Erro",
              "Não foi possível obter os dados!",
              "Recarregar",
              () {
                homeController.start();
              },
            );
          }
          return const MyCircularProgressIndicator();
        }),
      ),
    );
  }
}
