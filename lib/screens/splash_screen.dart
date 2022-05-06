import 'package:flutter/material.dart';
import 'package:mais_receitas/screens/home_page.dart';
import 'package:splashscreen/splashscreen.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
        seconds: 8,
        navigateAfterSeconds: const HomePage(),
        imageBackground: const AssetImage("lib/images/splash.gif"),
        backgroundColor: Colors.transparent,
        styleTextUnderTheLoader: const TextStyle(),
        loaderColor: Colors.purple);
  }
}
