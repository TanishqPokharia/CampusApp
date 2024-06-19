import 'package:campus_app/main.dart';
import 'package:flutter/material.dart';

class FeatureTitle extends StatelessWidget {
  const FeatureTitle({
    super.key,
    required this.icon,
    required this.title,
  });

  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: context.responsiveSize(220),
          margin: EdgeInsets.only(left: context.responsiveSize(30)),
          child: Row(
            children: [
              Icon(icon),
              SizedBox(
                width: context.responsiveSize(10),
              ),
              Text(
                title,
                style: context.textMedium,
              )
            ],
          ),
        ),
        const Spacer()
      ],
    );
  }
}
