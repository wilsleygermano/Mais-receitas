import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../design/my_colors.dart';

class MyTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final Icon icon;
  final TextInputAction textInputActionField;

  const MyTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.icon,
    required this.textInputActionField,
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
        controller: widget.controller,
        textInputAction: widget.textInputActionField,
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
