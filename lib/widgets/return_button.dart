import 'package:flutter/material.dart';
import 'package:mais_receitas/design/my_colors.dart';

class ReturnButton extends StatelessWidget {
  const ReturnButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon:const Icon(Icons.arrow_back_ios_outlined, color:MyColors.primarydark),
      onPressed: () => Navigator.of(context).pop(),
    );
  }
}