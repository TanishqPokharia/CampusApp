import 'package:campus_app/main.dart';
import 'package:flutter/material.dart';
import 'package:glass/glass.dart';

class NotificationDrawer extends StatelessWidget {
  const NotificationDrawer(
      {super.key, required this.onTap, required this.isOpened});
  final void Function() onTap;
  final bool isOpened;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: context.responsiveSize(50),
        width: double.infinity,
        child: Icon(
          isOpened ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
          color: Colors.indigoAccent,
        ),
      ).asGlass(
          tintColor: Colors.blue,
          blurX: 30,
          blurY: 30,
          tileMode: TileMode.mirror,
          clipBorderRadius: BorderRadius.circular(context.responsiveSize(20))),
    );
  }
}
