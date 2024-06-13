import 'dart:ui';

import 'package:blur/blur.dart';
import 'package:campus_app/main.dart';
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
              Container(
                margin: EdgeInsets.symmetric(
                    vertical: context.responsiveSize(15),
                    horizontal: context.responsiveSize(40)),
                child: TextFormField(
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                            hintText: "SRM Email / Net ID",
                            hintStyle: TextStyle(color: Colors.white54),
                            border:
                                OutlineInputBorder(borderSide: BorderSide.none),
                            focusedBorder:
                                OutlineInputBorder(borderSide: BorderSide.none),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide.none)))
                    .asGlass(
                        tintColor: Colors.indigo.shade400,
                        clipBorderRadius:
                            BorderRadius.circular(context.responsiveSize(20))),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                    vertical: context.responsiveSize(15),
                    horizontal: context.responsiveSize(40)),
                child: TextFormField(
                        style: TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                            hintText: "Password",
                            hintStyle: TextStyle(color: Colors.white54),
                            border:
                                OutlineInputBorder(borderSide: BorderSide.none),
                            focusedBorder:
                                OutlineInputBorder(borderSide: BorderSide.none),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide.none)))
                    .asGlass(
                        tintColor: Colors.indigo.shade400,
                        clipBorderRadius:
                            BorderRadius.circular(context.responsiveSize(20))),
              ),
              SizedBox(
                height: context.responsiveSize(20),
              ),
              DecoratedBox(
                decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(context.responsiveSize(10)),
                    gradient: const LinearGradient(colors: [
                      Colors.lightBlue,
                      Colors.indigoAccent,
                      Color.fromARGB(255, 121, 35, 220)
                    ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
                child: TextButton(
                    style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                context.responsiveSize(10))),
                        foregroundColor: Colors.white,
                        minimumSize: Size(context.responsiveSize(400), 50)),
                    onPressed: () {},
                    child: const Text(
                      "Sign In",
                      style: TextStyle(fontSize: 20),
                    )),
              )
            ],
          ),
        ),
      ],
    );
  }
}
