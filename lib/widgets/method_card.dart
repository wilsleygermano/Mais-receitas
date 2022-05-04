import 'package:flutter/material.dart';
// import 'package:mais_receitas/design/my_colors.dart';

class MethodCard extends StatelessWidget {
  const MethodCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[

          Text(
            "Suco de caju",
            style: Theme.of(context).textTheme.titleMedium,
          ),

         const Text("123456")
        ],
      ),
    );
  }
}
