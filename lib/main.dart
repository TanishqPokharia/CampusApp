import 'package:flutter/material.dart';
import 'package:campus_app/screens/navigation_menu_screen.dart';
import 'package:campus_app/screens/sign_in_screen.dart';
import 'package:campus_app/cookie_storage.dart';

bool isLoggedIn = false;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  final storedCookie = await CookieStorage().getCookie();
  
  if (storedCookie?.isNotEmpty ?? false) {
    isLoggedIn = true;
  }
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
          titleLarge: TextStyle(fontSize: context.responsiveSize(30)),
        ),
      ),
      home: isLoggedIn ? const NavigationMenu() : const SignInScreen(),
      routes: {
        '/signIn': (context) => const SignInScreen(),
        '/navigationMenu': (context) => const NavigationMenu(),
      },
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
