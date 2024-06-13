import 'dart:ui';

import 'package:flutter/material.dart';

class SignInBackgroundImage extends StatelessWidget {
  const SignInBackgroundImage({super.key});

  @override
  Widget build(BuildContext context) {
    return ImageFiltered(
      imageFilter:
          ImageFilter.blur(sigmaX: 6, sigmaY: 6, tileMode: TileMode.mirror),
      child: Image.asset(
        "assets/Vector1.png",
      ),
    );
  }
}
