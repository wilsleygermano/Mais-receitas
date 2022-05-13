import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../design/my_colors.dart';
import 'image_container.dart';

class ListCard extends StatefulWidget {

  final Function()? cardPressed;
  final String titleText;

  const ListCard({Key? key, this.cardPressed, required this.titleText}) : super(key: key);

  @override
  State<ListCard> createState() => _ListCardState();
}

class _ListCardState extends State<ListCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: MyColors.primarylight,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 0,
      child: InkWell(
        onTap: widget.cardPressed,
        splashColor: MyColors.primarydark,
        child: ListTile(
          title: Text(
            widget.titleText,
            style: TextStyle(
              overflow: TextOverflow.ellipsis,
              color: MyColors.primarydark,
              fontFamily: GoogleFonts.ptSerif().fontFamily,
              fontSize: 18,
            ),
            maxLines: 1,
          ),
          leading: const ImageContainer(
            assetImage: "lib/images/lead_icon.png",
            height: 32,
            width: 32,
          ),
        ),
      ),
    );
  }
}
