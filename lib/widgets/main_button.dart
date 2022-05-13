import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../design/my_colors.dart';

class MainButton extends StatelessWidget {
  final String labelText;
  final Function()? buttonPressed;


  const MainButton({ Key? key, required this.labelText, this.buttonPressed }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
                    width: 120,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: buttonPressed,
                      child: Text(
                        labelText,
                        style: TextStyle(
                          color:const Color.fromARGB(255, 82, 70, 114),
                          fontFamily: GoogleFonts.secularOne().fontFamily,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            MyColors.primaryoriginal),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  );
  }
}