// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:campus_app/widgets/modified_bottom_bar.dart';
import 'package:campus_app/screens/marks_screen.dart';
import 'package:flutter/material.dart';
import 'package:glass/glass.dart';

import 'package:campus_app/main.dart';
import 'package:campus_app/screens/attendance_screen.dart';
import 'package:campus_app/screens/clubs_screen.dart';
import 'package:campus_app/screens/dashboard_screen.dart';
import 'package:campus_app/screens/events_screen.dart';
import 'package:campus_app/screens/more_screen.dart';

class NavigationMenu extends StatefulWidget {
  const NavigationMenu({super.key});

  @override
  State<NavigationMenu> createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {
  int selectedIndex = 0;
  bool moreTapped = false;

  // List of screens corresponding to each tab
  final List<Widget> screens = [
    const DashboardScreen(),
    const AttendanceScreen(),
    const EventsScreen(),
    const MarksScreen(),
    const ClubsScreen(), //MarksScreen()
    const MoreScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: EdgeInsets.only(
            left: context.responsiveSize(50),
            right: context.responsiveSize(10)),
        child: Column(
          spacing: context.responsiveSize(20),
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            AnimatedSize(
              curve: Curves.fastEaseInToSlowEaseOut,
              duration: Durations.medium1,
              child: Container(
                margin: EdgeInsets.only(
                    bottom: moreTapped ? context.responsiveSize(50) : 0),
                height: context.responsiveSize(moreTapped ? 200 : 0),
                decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(context.responsiveSize(20))),
                child: Column(
                  spacing: context.responsiveSize(10),
                  children: [
                    MorePopupItem(
                      icon: Icons.groups,
                      title: "Clubs",
                      onTap: () {
                        setState(() {
                          moreTapped = !moreTapped;
                          selectedIndex = 4;
                        });
                      },
                    ),
                    MorePopupItem(
                      icon: Icons.edit_calendar,
                      title: "Planner",
                      onTap: () {
                        setState(() {
                          moreTapped = !moreTapped;
                          selectedIndex = 5;
                        });
                      },
                    )
                  ],
                ),
              ),
            ).asGlass(
                tintColor: Colors.blue,
                blurX: 30,
                blurY: 30,
                tileMode: TileMode.mirror,
                clipBorderRadius:
                    BorderRadius.circular(context.responsiveSize(20))),
            ModifiedBottomBar(
              borderRadius: BorderRadius.circular(context.responsiveSize(20)),
              backgroundColor: Colors.transparent,
              color: Colors.indigoAccent,
              colorSelected: Colors.purple,
              indexSelected: selectedIndex > 4 ? 4 : selectedIndex,
              items: const [
                TabItem(icon: Icons.home, title: "Dash."),
                TabItem(icon: Icons.percent, title: "Atten."),
                TabItem(icon: Icons.event, title: "Events"),
                TabItem(icon: Icons.bar_chart, title: "Marks"),
                TabItem(icon: Icons.keyboard_arrow_up, title: "More")
              ],
              onTap: (index) {
                print(index);
                setState(() {
                  if (index == 4) {
                    moreTapped = !moreTapped;
                  } else {
                    selectedIndex = index;
                  }
                });
              },
            ).asGlass(
                tintColor: Colors.blue,
                blurX: 30,
                blurY: 30,
                tileMode: TileMode.mirror,
                clipBorderRadius:
                    BorderRadius.circular(context.responsiveSize(20))),
          ],
        ),
      ),
      body: screens[selectedIndex],
    );
  }
}

class MorePopupItem extends StatelessWidget {
  const MorePopupItem({
    super.key,
    this.onTap,
    required this.icon,
    required this.title,
  });

  final void Function()? onTap;
  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
            width: context.responsiveSize(80),
            padding: EdgeInsets.all(context.responsiveSize(10)),
            child: Column(
              spacing: context.responsiveSize(5),
              children: [
                Icon(
                  icon,
                  color: Colors.indigoAccent,
                ),
                Text(
                  title,
                  style:
                      context.textSmall!.copyWith(color: Colors.indigoAccent),
                )
              ],
            )));
  }
}
