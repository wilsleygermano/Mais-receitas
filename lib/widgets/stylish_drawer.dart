import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:mais_receitas/design/my_colors.dart';
import 'package:mais_receitas/screens/logout_screen.dart';

class StylishDrawer extends StatefulWidget {
  const StylishDrawer({Key? key}) : super(key: key);

  @override
  State<StylishDrawer> createState() => _StylishDrawerState();
}

class _StylishDrawerState extends State<StylishDrawer> {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: DrawerStyle(),
      child: Container(
        width: 300,
        height: 700,
        child: Stack(
          children: <Widget>[
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
              child: Container(
                decoration:
                     BoxDecoration(color:  Color.fromARGB(255, 255, 247, 255).withOpacity(0.5)),
              ),
            ),
            Container(
              child: ListView(
                children: <Widget>[
                  Column(
                    children:  <Widget>[
                      Padding(
                        padding:const  EdgeInsets.fromLTRB(20, 50, 45, 20),
                        child: SizedBox(
                            height: 150,
                            width: 150,
                            child: CircleAvatar(
                              backgroundImage:
                                 const AssetImage("lib/images/simplelogo.png"),
                              backgroundColor: MyColors.primarylight.withOpacity(0.8),
                            )),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  const Divider(height: 0.5, color: MyColors.primarylight),
                  const ListTile(
                    leading: Icon(Icons.info_outline, color: MyColors.primarylight,size: 25,),
                    title: Text("Sobre", style: TextStyle(color: MyColors.primarylight,fontSize: 20)),
                  ),
                  const Divider(height: 0.5, color: MyColors.primarylight),
                  ListTile(
                    leading: const Icon(Icons.logout, color: MyColors.primarylight,size: 25,),
                    title: const Text("Sair",
                        style: TextStyle(color: MyColors.primarylight,fontSize: 20)),
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LogoutScreen(),
                        )),
                        
                  ),
                  const Divider(height: 0.5, color: MyColors.primarylight),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class DrawerStyle extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    path.quadraticBezierTo(
        size.width / 4, size.height, size.width / 2, size.height - 40);
    path.quadraticBezierTo(
        size.width - 50, size.height - 80, size.width, size.height);
    path.quadraticBezierTo(size.width - 100, size.height / 2, size.width, 0);
    path.quadraticBezierTo(size.width / 2, 30, 0, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    throw UnimplementedError();
  }
}
