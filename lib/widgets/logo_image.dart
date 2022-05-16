import 'package:flutter/material.dart';

class LogoImage extends StatelessWidget {
  const LogoImage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
                      height: 268,
                      width: 237,
                      alignment: Alignment.topCenter,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('lib/images/logo.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    );
  }
}