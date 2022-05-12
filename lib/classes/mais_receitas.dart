import 'package:flutter/material.dart';
import 'package:mais_receitas/screens/splash_screen.dart';

class MaisReceitas extends StatelessWidget {
  const MaisReceitas({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Splash(),
    );
  }
}