import 'package:flutter/material.dart';
import 'package:mais_receitas/design/my_colors.dart';

class MyPasswordField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final Icon icon;
  final TextInputAction textInputActionField;


  const MyPasswordField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.icon, required this.textInputActionField,
  }) : super(key: key);

  @override
  State<MyPasswordField> createState() => _MyPasswordFieldState();
}

class _MyPasswordFieldState extends State<MyPasswordField> {
  late bool _isVisible;

  @override
  void initState() {
    _isVisible = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 25, right: 25, bottom: 20),
      child: TextField(
        textInputAction: widget.textInputActionField,
        controller: widget.controller,
        obscureText: !_isVisible,
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
          suffixIcon: IconButton(
            icon: Icon(
              _isVisible ? Icons.visibility : Icons.visibility_off,
              color: MyColors.primarydark,
            ),
            onPressed: () {
              setState(() {
                _isVisible = !_isVisible;
              });
            },
          ),
        ),
      ),
    );
  }
}
