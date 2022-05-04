import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mais_receitas/design/my_colors.dart';

class MyTheme {
 


  static ThemeData theme = ThemeData(
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontSize: 24,
        color: MyColors.primarydark,
        fontFamily: GoogleFonts.ptSerif().fontFamily,
        letterSpacing: 0.4,
      ),
      titleMedium: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.bold,
        color: MyColors.primaryblack,
        fontFamily: GoogleFonts.inter().fontFamily,
      ),
      titleSmall: TextStyle(
        fontSize: 12,
        color: MyColors.primaryblack,
        fontFamily: GoogleFonts.ptSerif().fontFamily,
      ),
    ),
  );
}
