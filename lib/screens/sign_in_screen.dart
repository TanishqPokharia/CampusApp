import 'dart:ui';

import 'package:blur/blur.dart';
import 'package:campus_app/main.dart';
import 'package:campus_app/widgets/button.dart';
import 'package:campus_app/widgets/glass_textformfield.dart';
import 'package:campus_app/widgets/sign_in_background.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:glass/glass.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const SignInBackgroundImage(),
        Scaffold(
          backgroundColor: Colors.indigo.shade900.withOpacity(0.1),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/Logo.png"),
              Padding(
                  padding: EdgeInsets.only(
                      top: context.responsiveSize(40),
                      bottom: context.responsiveSize(10),
                      left: context.responsiveSize(40),
                      right: context.responsiveSize(40)),
                  child: GlassTextFormField(hintText: "SRM Email/ Net ID")),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: context.responsiveSize(40),
                    vertical: context.responsiveSize(10)),
                child: GlassTextFormField(hintText: "Password"),
              ),
              SizedBox(
                height: context.responsiveSize(20),
              ),
              GradientButton(
                title: "Sign In",
                textStyle: context.textMedium,
                width: double.infinity,
                margin: EdgeInsets.symmetric(
                    horizontal: context.responsiveSize(40)),
              )
            ],
          ),
        ),
      ],
    );
  }
}
