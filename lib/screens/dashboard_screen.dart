import 'dart:ui';

import 'package:blur/blur.dart';
import 'package:campus_app/main.dart';
import 'package:campus_app/screens/sign_in_screen.dart';
import 'package:campus_app/widgets/background.dart';
import 'package:campus_app/widgets/events_carousel.dart';
import 'package:campus_app/widgets/feature_title_widget.dart';
import 'package:campus_app/widgets/notification_drawer.dart';
import 'package:campus_app/widgets/notification_tile.dart';
import 'package:campus_app/widgets/your_standing_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:glass/glass.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

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
                    height: context.responsiveSize(200),
                  ),
                  SvgPicture.asset("assets/Logo.svg"),
                  Container(
                    margin: EdgeInsets.only(top: context.responsiveSize(100)),
                    child: const FeatureTitle(
                      icon: Icons.person,
                      title: "Your Standings",
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.all(context.responsiveSize(20)),
                      height: context.responsiveSize(120),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Expanded(
                              child: YourStanding(
                                  top: "82%", bottom: "Attendance")),
                          SizedBox(
                            width: context.responsiveSize(20),
                          ),
                          const Expanded(
                            child:
                                YourStanding(top: "180/240", bottom: "Marks"),
                          )
                        ],
                      )),
                  Container(
                    margin: EdgeInsets.only(top: context.responsiveSize(20)),
                    child: const FeatureTitle(
                        icon: Icons.notifications, title: "Notifications"),
                  ),
                  Container(
                    height: context.responsiveSize(220),
                    margin: EdgeInsets.symmetric(
                        horizontal: context.responsiveSize(20)),
                    child: ListView(
                      children: [
                        const NotificationTile(
                            title: "Marked absent for environmental science",
                            impact: false),
                        SizedBox(
                          height: context.responsiveSize(20),
                        ),
                        const NotificationTile(
                            title:
                                "You now have 75% attendance in Constitution of India",
                            impact: true)
                      ],
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: context.responsiveSize(20)),
                      child: NotificationDrawer(onTap: () {}, isOpened: false)),
                  Container(
                    margin: EdgeInsets.only(top: context.responsiveSize(20)),
                    child:
                        const FeatureTitle(icon: Icons.event, title: "Events"),
                  ),
                  Container(
                    margin: EdgeInsets.all(context.responsiveSize(20)),
                    child: EventsCarousel(),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
