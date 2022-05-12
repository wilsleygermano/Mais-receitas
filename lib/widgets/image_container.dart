import 'package:flutter/material.dart';

class ImageContainer extends StatelessWidget {
  final double? height;
  final double? width;
  final String assetImage;
  const ImageContainer(
      {required this.assetImage, this.height, this.width, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(assetImage),
        ),
      ),
    );
  }
}
