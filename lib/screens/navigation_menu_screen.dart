import 'package:campus_app/main.dart';
import 'package:campus_app/screens/dashboard_screen.dart';
import 'package:campus_app/screens/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:campus_app/main.dart';

import 'package:campus_app/screens/dashboard_screen.dart';
import 'package:campus_app/screens/attendance_screen.dart';
import 'package:campus_app/screens/events_screen.dart';
import 'package:campus_app/screens/marks_screen.dart';
import 'package:campus_app/screens/more_screen.dart';

import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:glass/glass.dart';

class NavigationMenu extends StatefulWidget {
  const NavigationMenu({super.key});

  @override
  State<NavigationMenu> createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {
  int selectedIndex = 0;

  // List of screens corresponding to each tab
  final List<Widget> screens = [
    DashboardScreen(),
    AttendanceScreen(),
    EventsScreen(),
    MarksScreen(),
    MoreScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      floatingActionButton: Container(
        padding: EdgeInsets.only(
            left: context.responsiveSize(50),
            right: context.responsiveSize(10)),
        child: BottomBarFloating(
          borderRadius: BorderRadius.circular(context.responsiveSize(20)),
          backgroundColor: Colors.transparent,
          color: Colors.indigoAccent,
          colorSelected: Colors.purple,
          indexSelected: selectedIndex,
          items: const [
            TabItem(icon: Icons.home, title: "Dash."),
            TabItem(icon: Icons.percent, title: "Atten."),
            TabItem(icon: Icons.event, title: "Events"),
            TabItem(icon: Icons.bar_chart, title: "Marks"),
            TabItem(icon: Icons.keyboard_arrow_up, title: "More")
          ],
          onTap: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
        ).asGlass(
            tintColor: Colors.blue,
            blurX: 30,
            blurY: 30,
            tileMode: TileMode.mirror,
            clipBorderRadius:
                BorderRadius.circular(context.responsiveSize(20))),
      ),
      // body: DashboardScreen(),
      body: screens[selectedIndex],
    );
  }
}
