import 'dart:ui';

import 'package:flutter/material.dart';

class SignInBackgroundImage extends StatelessWidget {
  const SignInBackgroundImage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Align(
              alignment: AlignmentDirectional(0, 0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  'assets/background.png',
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.fill,
                ),
              ),
            );
  }
}


