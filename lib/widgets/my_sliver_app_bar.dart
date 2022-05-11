import 'package:flutter/material.dart';
import 'package:mais_receitas/design/my_colors.dart';

class MySliverAppBar extends StatefulWidget {
  const MySliverAppBar({Key? key}) : super(key: key);

  @override
  State<MySliverAppBar> createState() => _MySliverAppBarState();
}

class _MySliverAppBarState extends State<MySliverAppBar> {
  final bool _pinned = false;
  final bool _snap = false;
  final bool _floating = false;


  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      leading: IconButton(
        iconSize: 32,
        onPressed: () {},
        icon: const Icon(Icons.menu),
        color: MyColors.primarydark
      ),
      actions: [
        IconButton(
          iconSize: 32,
          onPressed: () {},
          icon: const Icon(Icons.search),
          color: MyColors.primarydark,
        ),
      ],
      // elevation: 0,
      stretch: true,
      pinned:  _pinned,
      floating: _floating,
      snap: _snap,
      expandedHeight: 250,
      backgroundColor: Colors.transparent,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: const EdgeInsets.only(top: 64),
        title: const Padding(
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
    )
    ;
  }
}
