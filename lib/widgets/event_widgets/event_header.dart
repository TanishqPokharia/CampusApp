import 'package:campus_app/main.dart';
import 'package:flutter/material.dart';

class EventHeader extends StatelessWidget {
  const EventHeader(
      {super.key,
      required this.title,
      required this.organizer,
      required this.image});
  final String title;
  final String organizer;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: context.textMedium,
            ),
            Text(
              "by $organizer",
              style: context.textSmall!.copyWith(color: Colors.grey),
            )
          ],
        ),
        Container(
          height: context.responsiveSize(70),
          width: context.responsiveSize(70),
          margin: EdgeInsets.only(right: context.responsiveSize(30)),
          decoration: BoxDecoration(
              color: Colors.indigo,
              borderRadius: BorderRadius.circular(context.responsiveSize(20)),
              image: DecorationImage(
                  fit: BoxFit.contain, image: NetworkImage(image))),
        )
      ],
    );
  }
}
