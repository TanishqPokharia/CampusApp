import 'package:campus_app/widgets/background.dart';
import 'package:flutter/material.dart';
import 'package:campus_app/main.dart';

class EventsScreen extends StatelessWidget {
  const EventsScreen({super.key});

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
          ],
        ),
      ),
    );
  }
}
