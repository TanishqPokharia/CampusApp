import 'dart:ui';

import 'package:campus_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({super.key});

  @override
  Widget build(BuildContext context) {
    return ImageFiltered(
      imageFilter:
          ImageFilter.blur(sigmaX: 10, sigmaY: 10, tileMode: TileMode.mirror),
      child: Container(
        child: Column(
          children: [
            SvgPicture.asset(
              "assets/Dashboard.svg",
              width: context.screenWidth,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}
