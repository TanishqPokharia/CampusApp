import 'package:campus_app/main.dart';
import 'package:flutter/material.dart';

class EventPopularity extends StatelessWidget {
  const EventPopularity({super.key, required this.popularity});
  final String popularity;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "Popularity:   $popularity x",
          style: context.textSmall!.copyWith(
            color: Colors.blue.shade100,
          ),
        ),
        Icon(
          Icons.star_border_rounded,
          color: Colors.yellow,
        )
      ],
    );
  }
}
