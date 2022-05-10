import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mais_receitas/design/my_colors.dart';

class ReturnButton extends StatelessWidget {
  const ReturnButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon:const Icon(FontAwesomeIcons.circleArrowLeft, color:MyColors.primarydark,size: 35,),
      onPressed: () => Navigator.of(context).pop(),
    );
  }
}