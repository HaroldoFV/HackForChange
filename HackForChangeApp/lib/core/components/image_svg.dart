import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ImageSvg extends StatelessWidget {
  final String imageUrl;

  const ImageSvg({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      imageUrl,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      fit: BoxFit.fill,
    );
  }
}
