import 'package:campus_app/main.dart';
import 'package:flutter/material.dart';
import 'package:glass/glass.dart';

class YourStanding extends StatelessWidget {
  const YourStanding({super.key, required this.top, required this.bottom});
  final String top;
  final String bottom;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          top,
          style: context.textLarge,
        ),
        Text(
          bottom,
          style: context.textSmall,
        )
      ],
    ).asGlass(
        tintColor: Colors.indigo.shade500,
        clipBorderRadius: BorderRadius.circular(context.responsiveSize(20)));
  }
}
