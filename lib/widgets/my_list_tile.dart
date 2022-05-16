import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mais_receitas/design/my_colors.dart';

class MyListTile extends StatefulWidget {
final String tileText;
final Icon tileIcon;
final IconButton? trailingIconButton;
final Function()? trailingPressed;


  const MyListTile({ Key? key, required this.tileText, required this.tileIcon, this.trailingIconButton, this.trailingPressed, }) : super(key: key);

  @override
  State<MyListTile> createState() => _MyListTileState();
}

class _MyListTileState extends State<MyListTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
                    title: Text(
                      widget.tileText,
                      style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        color: MyColors.primarydark,
                        fontFamily: GoogleFonts.ptSerif().fontFamily,
                        fontSize: 18,
                      ),
                      maxLines: 1,
                    ),
                    leading: widget.tileIcon,
                    trailing: widget.trailingIconButton,
                  );
  }
}