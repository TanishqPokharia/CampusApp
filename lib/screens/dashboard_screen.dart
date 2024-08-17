import 'package:campus_app/main.dart';
import 'package:campus_app/providers/events/events_provider.dart';
import 'package:campus_app/providers/user_data/user_data_provider.dart';
import 'package:campus_app/widgets/screen_base.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:campus_app/widgets/dashboard_widgets/dashboard_widgets.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ScreenBase(
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
          ref.watch(userDataProvider).when(
            loading: () {
              return Container(
                  margin: EdgeInsets.all(context.responsiveSize(20)),
                  height: context.responsiveSize(120),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Expanded(
                          child: YourStanding(
                              top: "Loading", bottom: "Attendance")),
                      SizedBox(
                        width: context.responsiveSize(20),
                      ),
                      const Expanded(
                        child: YourStanding(top: "Loading", bottom: "Marks"),
                      )
                    ],
                  ));
            },
            data: (data) {
              if (data.testPerformances.isEmpty || data.courses.isEmpty) {
                return Container(
                    margin: EdgeInsets.all(context.responsiveSize(20)),
                    height: context.responsiveSize(120),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Expanded(
                            child:
                                YourStanding(top: "0%", bottom: "Attendance")),
                        SizedBox(
                          width: context.responsiveSize(20),
                        ),
                        const Expanded(
                          child: YourStanding(top: "0/0", bottom: "Marks"),
                        )
                      ],
                    ));
              }
              print(data);
              final marks = data.testPerformances
                  .map((e) => e.totalMarks)
                  .reduce((value, element) => value + element);
              final marksGot = data.testPerformances
                  .map((e) => e.totalMarkGot)
                  .reduce((value, element) => value + element);
              final attendance = data.courses
                      .map((course) => double.parse(course.attendancePercent))
                      .reduce((value, element) => value + element) /
                  data.courses.length;
              return Container(
                  margin: EdgeInsets.all(context.responsiveSize(20)),
                  height: context.responsiveSize(120),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                          child: YourStanding(
                              top: "${attendance.roundToDouble()}%",
                              bottom: "Attendance")),
                      SizedBox(
                        width: context.responsiveSize(20),
                      ),
                      Expanded(
                        child: YourStanding(
                            top: "$marksGot/$marks", bottom: "Marks"),
                      )
                    ],
                  ));
            },
            error: (error, stackTrace) {
              return Container(
                  margin: EdgeInsets.all(context.responsiveSize(20)),
                  height: context.responsiveSize(120),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Expanded(
                          child:
                              YourStanding(top: "82%", bottom: "Attendance")),
                      SizedBox(
                        width: context.responsiveSize(20),
                      ),
                      const Expanded(
                        child: YourStanding(top: "0/0", bottom: "Marks"),
                      )
                    ],
                  ));
            },
          ),
          Container(
            margin: EdgeInsets.only(top: context.responsiveSize(20)),
            child: const FeatureTitle(
                icon: Icons.notifications, title: "Notifications"),
          ),
          Container(
            height: context.responsiveSize(220),
            margin:
                EdgeInsets.symmetric(horizontal: context.responsiveSize(20)),
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
                  vertical: context.responsiveSize(20),
                  horizontal: context.responsiveSize(20)),
              child: NotificationDrawer(onTap: () {}, isOpened: false)),
          Container(
            margin: EdgeInsets.only(top: context.responsiveSize(20)),
            child: const FeatureTitle(icon: Icons.event, title: "Events"),
          ),
          ref.watch(eventsProvider).when(
                loading: () => Center(
                  child: CircularProgressIndicator(),
                ),
                data: (data) {
                  return Container(
                    margin: EdgeInsets.all(context.responsiveSize(20)),
                    child: EventsCarousel(
                      events: data,
                    ),
                  );
                },
                error: (error, stackTrace) {
                  print(error);
                  print(stackTrace);
                  return const Text("Could not fetch events");
                },
              )
        ],
      ),
    );
  }
}
