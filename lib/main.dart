import 'package:campus_app/screens/dashboard_screen.dart';
import 'package:campus_app/screens/navigation_menu_screen.dart';
import 'package:campus_app/screens/sign_in_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          textTheme: TextTheme(
              titleSmall: TextStyle(fontSize: context.responsiveSize(16)),
              titleMedium: TextStyle(fontSize: context.responsiveSize(24)),
              titleLarge: TextStyle(fontSize: context.responsiveSize(30)))),
      home: NavigationMenu(),
    );
  }
}

extension ResponsiveExtensions on BuildContext {
  double get screenWidth => MediaQuery.of(this).size.width;
  double get screenHeight => MediaQuery.of(this).size.height;
  double responsiveSize(double size) => screenHeight * (size / 1000);
  TextStyle? get textSmall => Theme.of(this).textTheme.titleSmall;
  TextStyle? get textMedium => Theme.of(this).textTheme.titleMedium;
  TextStyle? get textLarge => Theme.of(this).textTheme.titleLarge;
}
