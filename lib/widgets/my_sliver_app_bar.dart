import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mais_receitas/controller/home_controller.dart';
import 'package:mais_receitas/data/recipes_name_model.dart';
import 'package:mais_receitas/design/my_colors.dart';
import 'package:mais_receitas/widgets/drawer.dart';
import 'package:mais_receitas/screens/recipes_screen.dart';
import 'package:mais_receitas/widgets/recipes_search.dart';

class MySliverAppBar extends StatefulWidget {
  const MySliverAppBar({Key? key}) : super(key: key);

  @override
  State<MySliverAppBar> createState() => _MySliverAppBarState();
}

class _MySliverAppBarState extends State<MySliverAppBar> {
  final bool _pinned = false;
  final bool _snap = false;
  final bool _floating = false;
  final controller = HomeController();

  @override
  void initState() {
    setState(() {
      controller.start();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      leading: IconButton(
          iconSize: 32,
          onPressed: () => Scaffold.of(context).openDrawer(),
          icon: const Icon(Icons.menu),
          color: MyColors.primarydark),
      actions: [
        IconButton(
          iconSize: 32,
          onPressed: () {
            showSearch(
              context: context,
              delegate: RecipesSearch(
                controller.allRecipesName.recipesName!,
                controller.start(),
                controller,
              ),
            );
          },
          icon: const Icon(Icons.search),
          color: MyColors.primarydark,
        ),
      ],
      // elevation: 0,
      stretch: true,
      pinned: _pinned,
      floating: _floating,
      snap: _snap,
      expandedHeight: 250,
      backgroundColor: Colors.transparent,
      flexibleSpace: const FlexibleSpaceBar(
        titlePadding: EdgeInsets.only(top: 64),
        title:  Padding(
          padding: EdgeInsets.only(
            top: 8,
            left: 8,
            right: 8,
          ),
          child: Image(
            fit: BoxFit.fill,
            image: AssetImage(
              'lib/images/logo.png',
            ),
          ),
        ),
        centerTitle: true,
      ),
    );
  }
}

