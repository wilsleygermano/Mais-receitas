import 'package:flutter/material.dart';
import 'package:mais_receitas/screens/home_screen.dart';

import 'package:mais_receitas/screens/login_screen.dart';
import 'package:mais_receitas/widgets/main_button.dart';



class LogoutScreen extends StatelessWidget {
  

  const LogoutScreen({Key? key, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Center(
          child: Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('lib/images/background.png'),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 268,
                          width: 237,
                          alignment: Alignment.topCenter,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('lib/images/logo.png'),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 300,
                          width: 300,
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                            image: AssetImage('lib/images/avocado.gif'),
                            fit: BoxFit.fill,
                          )),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MainButton(
                          labelText: "NÃO",
                          buttonPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomeScreen(),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        MainButton(
                          labelText: "SIM",
                          buttonPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginScreen(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
