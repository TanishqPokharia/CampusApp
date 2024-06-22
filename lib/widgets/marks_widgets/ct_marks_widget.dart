import 'package:flutter/material.dart';
import 'package:campus_app/main.dart';

class CtMarksWidgetCard extends StatelessWidget {
  const CtMarksWidgetCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color.fromRGBO(12, 77, 162, 0.2),
      child: Padding(
        padding: EdgeInsets.all(context.responsiveSize(6)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "CLA-1",
              style: TextStyle(
                fontSize: context.responsiveSize(14),
                fontWeight: FontWeight.w700,
                color: Color.fromRGBO(0, 148, 255, 1),
              ),
            ),
            Text(
              "15/20",
              style: TextStyle(fontSize: context.responsiveSize(14), fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ),
    );
  }
}
