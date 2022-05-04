import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../design/my_colors.dart';

myDialog(
  BuildContext mycontext,
  String titleText,
  String contentText,
  String buttonText,
  Function()? onpressed,
) {
  return showDialog(
    context: mycontext,
    builder: (context) => AlertDialog(
      title: Text(
        titleText,
        style: TextStyle(
            fontFamily: GoogleFonts.inter().fontFamily,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: MyColors.primarydark),
      ),
      content: Text(
        contentText,
        style: TextStyle(
            fontFamily: GoogleFonts.inter().fontFamily,
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: MyColors.primarydark),
      ),
      actions: <Widget>[
        OutlinedButton(
          onPressed: onpressed,
          child: Text(
            buttonText,
            style: TextStyle(
                fontFamily: GoogleFonts.inter().fontFamily,
                fontSize: 12,
                color: MyColors.primaryoriginal),
          ),
        )
      ],
    ),
  );
}
