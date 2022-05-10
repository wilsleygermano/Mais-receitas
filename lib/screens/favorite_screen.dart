// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:mais_receitas/controller/get_favorite_recipes.dart';
// import 'package:mais_receitas/design/my_colors.dart';
// import 'package:mais_receitas/screens/recipes_page.dart';
// import 'package:mais_receitas/widgets/bottom_bar.dart';

// import '../widgets/my_sliver_app_bar.dart';

// class FavoriteScreen extends StatefulWidget {
//   const FavoriteScreen({ Key? key }) : super(key: key);

//   @override
//   State<FavoriteScreen> createState() => _FavoriteScreenState();
// }

// class _FavoriteScreenState extends State<FavoriteScreen> {
//   late Box<String> favoriteRecipeBox;
//   late String userId;
//   late List<String> favRecipesList;

//   @override
//   void initState() {
//     favoriteRecipeBox = Hive.box("favoriteBox2");
//     userId = favoriteRecipeBox.values.toString();
//     super.initState();
//   }


//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.transparent,
//       bottomNavigationBar: BottomBar(),
//       body: FutureBuilder(
//         future: getFavoriteRecipes(userId),
//         builder: ((context, snapshot) {
//           if (snapshot.hasData) {
//             return Stack(
//               children: [
//                 Container(
//                   decoration: const BoxDecoration(
//                     image: DecorationImage(
//                         image: AssetImage('lib/images/background.png'),
//                         fit: BoxFit.fill),
//                   ),
//                 ),
//                 CustomScrollView(
//                   slivers: <Widget>[
//                     MySliverAppBar(),
//                     SliverList(
//                       delegate: SliverChildBuilderDelegate(
//                           (BuildContext context, int index) {
//                         return Card(
//                           color: MyColors.primarylight,
//                           shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(10)),
//                           elevation: 0,
                          
//                           child: InkWell(
//                             onTap: () {
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: ((context) => RecipesPage(user: userId,
//                                         recipesName: homeController
//                                             .allRecipesName.recipesName![index],
//                                       )),
//                                 ),
//                               );
//                             },
//                             splashColor: MyColors.primarydark,
//                             child: ListTile(
//                               title: Text(
//                                 "${homeController.allRecipesName.recipesName![index]}",
//                                 style: TextStyle(
//                                   overflow: TextOverflow.ellipsis,
//                                   color: MyColors.primarydark,
//                                   fontFamily: GoogleFonts.ptSerif().fontFamily,
//                                   fontSize: 18,
//                                 ),
//                                 maxLines: 1,
//                               ),
//                               leading: Container(
//                                 height: 32,
//                                 width: 34,
//                                 decoration: const BoxDecoration(
//                                   image: DecorationImage(
//                                     image:
//                                         AssetImage("lib/images/lead_icon.png"),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         );
//                       }),
//                     ),
//                   ],
//                 ),
//               ],
//             );
//           }
//           if (snapshot.connectionState == ConnectionState.none) {
//             showDialog(
//               context: context,
//               builder: (context) {
//                 return Dialog(
//                   backgroundColor: Colors.white,
//                   elevation: 8,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(16),
//                   ),
//                   child: ElevatedButton(
//                     child: const Text("Try again"),
//                     onPressed: () {
//                       setState(
//                         () {
//                           homeController.start();
//                         },
//                       );
//                     },
//                   ),
//                 );
//               },
//             );
//           }
//           return const Center(
//             child: CircularProgressIndicator(
//               color: Colors.purple,
//               strokeWidth: 8.0,
//             ),
//           );
//         }),
//       ),
//     );
//   }
// }