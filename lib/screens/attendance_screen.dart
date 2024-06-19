import 'package:campus_app/widgets/attendance_widget.dart';
import 'package:campus_app/widgets/screen_base.dart';
import 'package:flutter/material.dart';
import 'package:campus_app/main.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:campus_app/widgets/background.dart';

class AttendanceScreen extends StatelessWidget {
  const AttendanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenBase(
      title: "Attendance",
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(context.responsiveSize(20)),
            child: AttendanceWidget(),
          )
        ],
      ),
    );
  }
}
