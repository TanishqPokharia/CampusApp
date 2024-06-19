import 'package:campus_app/widgets/attendance_widget.dart';
import 'package:flutter/material.dart';
import 'package:campus_app/main.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:campus_app/widgets/background.dart';

class AttendanceScreen extends StatelessWidget {
  const AttendanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            const BackgroundImage(),
            Container(
              height: context.screenHeight,
              width: context.screenWidth,
              color: Colors.indigo.shade900.withOpacity(0.1),
            ),
            Padding(
              padding: EdgeInsets.all(context.responsiveSize(8)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: context.responsiveSize(60),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: context.responsiveSize(16)),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Image.asset("assets/logo_small.png")),
                  ),
                  Container(
                      margin: EdgeInsets.all(context.responsiveSize(20)),
                      alignment: Alignment.centerLeft,
                      child: SvgPicture.asset("assets/attendance.svg")),
                  Container(
                    width: context.responsiveSize(400),
                    height: context.responsiveSize(152),
                    child: AttendanceWidget(),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
