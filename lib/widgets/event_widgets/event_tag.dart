import 'package:campus_app/main.dart';
import 'package:flutter/material.dart';
import 'package:glass/glass.dart';

class EventTag extends StatelessWidget {
  const EventTag({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: context.responsiveSize(20),
            vertical: context.responsiveSize(10)),
        alignment: Alignment.center,
        child: Text(
          title,
          style: context.textSmall!.copyWith(color: Colors.blue.shade100),
        ),
      ).asGlass(
          frosted: false,
          tintColor: Colors.blue,
          clipBorderRadius: BorderRadius.circular(20)),
    );
  }
}
