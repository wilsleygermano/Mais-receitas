import 'package:flutter/material.dart';
import 'package:mais_receitas/screens/home_screen.dart';
import 'package:mais_receitas/screens/login_screen.dart';
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
        seconds: 4,
        navigateAfterSeconds: LoginScreen(),
        imageBackground: const AssetImage("lib/images/splash.gif"),
        backgroundColor: Colors.transparent,
        styleTextUnderTheLoader: const TextStyle(),
        loaderColor: Colors.purple);
  }
}
