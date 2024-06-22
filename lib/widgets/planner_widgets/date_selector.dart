import 'package:campus_app/main.dart';
import 'package:flutter/material.dart';
import 'package:glass/glass.dart';

class DateSelector extends StatelessWidget {
  const DateSelector({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.responsiveSize(10)),
      child: ListTile(
        contentPadding:
            EdgeInsets.symmetric(horizontal: context.responsiveSize(40)),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(context.responsiveSize(20))),
        trailing: Icon(
          Icons.calendar_today_outlined,
          color: Colors.blue.shade600,
        ),
        title: Text(
          "DD/MM/YY - DD/MM/YY",
          style: context.textMedium!.copyWith(
              color: Colors.blue.shade100,
              fontSize: context.responsiveSize(20)),
        ),
      ).asGlass(
          frosted: false,
          tintColor: Colors.blue,
          clipBorderRadius: BorderRadius.circular(context.responsiveSize(20))),
    );
  }
}
