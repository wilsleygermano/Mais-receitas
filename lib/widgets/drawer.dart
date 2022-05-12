import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mais_receitas/design/my_colors.dart';
import 'package:mais_receitas/screens/logout_screen.dart';

import 'main_button.dart';
// import 'package:mais_receitas/screens/logout_screen.dart';
// import 'package:mais_receitas/widgets/return_button.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.70,
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            
            const SizedBox(
              height: 40,
            ),
            ListTile(
              title: Padding(
                padding: const EdgeInsets.only(top: 8, left: 16),
                child: Container(),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            ListTile(
              title: Padding(
                padding: const EdgeInsets.only(top: 8, left: 16),
                child: MainButton(
                  labelText: "SOBRE",
                  buttonPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LogoutScreen(),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            ListTile(
              title: Padding(
                padding: const EdgeInsets.only(top: 8, left: 16),
                child: MainButton(
                  labelText: "SAIR",
                  buttonPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LogoutScreen(),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
