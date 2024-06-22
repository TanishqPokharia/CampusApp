import 'package:campus_app/main.dart';
import 'package:campus_app/widgets/screen_base.dart';
import 'package:flutter/material.dart';

import '../widgets/marks_widgets/marks_widget.dart';

class MarksScreen extends StatelessWidget {
  const MarksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenBase(
      title: "Marks",
      child: Container(
        width: context.screenWidth,
        child: MarksWidget(),
      ),
    );
  }
}
