import 'package:flutter/material.dart';

import '../design/my_colors.dart';

class MyTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final Icon icon;
  final bool isObscure;

  const MyTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.icon,
    this.isObscure = false,
  }) : super(key: key);
  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 25, right: 25, bottom: 20),
      child: TextField(
        obscureText: widget.isObscure,
        controller: widget.controller,
        decoration: InputDecoration(
          icon: widget.icon,
          hintText: widget.hintText,
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: MyColors.primarydark,
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: MyColors.primarydark,
            ),
          ),
        ),
      ),
    );
  }
}
