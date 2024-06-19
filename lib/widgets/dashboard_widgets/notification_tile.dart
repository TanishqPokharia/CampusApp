import 'package:campus_app/main.dart';
import 'package:flutter/material.dart';
import 'package:glass/glass.dart';

class NotificationTile extends StatelessWidget {
  const NotificationTile(
      {super.key, required this.title, required this.impact});
  final String title;
  final bool impact;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(context.responsiveSize(20))),
      title: Text(
        title,
        style: context.textSmall,
      ),
      trailing: impact
          ? const Icon(
              Icons.keyboard_arrow_up,
              color: Colors.green,
            )
          : const Icon(
              Icons.keyboard_arrow_down,
              color: Colors.red,
            ),
    ).asGlass(
        tintColor: Colors.blue,
        blurX: 30,
        blurY: 30,
        tileMode: TileMode.mirror,
        clipBorderRadius: BorderRadius.circular(context.responsiveSize(20)));
  }
}
