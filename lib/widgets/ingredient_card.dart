import 'package:flutter/material.dart';
// import 'package:mais_receitas/design/my_colors.dart';

class IngredientCard extends StatelessWidget {
  const IngredientCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(left: 16,right: 16.0),
      child: SizedBox(
        height: 350,
        // width: 340,
        child: Text(
          "Suco de caju",
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
    );
  }
}
