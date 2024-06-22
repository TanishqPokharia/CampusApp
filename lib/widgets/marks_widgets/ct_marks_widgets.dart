import 'package:flutter/material.dart';
import 'package:campus_app/main.dart';

class CtMarksWidgetCard extends StatelessWidget {
  const CtMarksWidgetCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minWidth: context.responsiveSize(100)),
      height: context.responsiveSize(80),
      decoration: BoxDecoration(
          color: Color.fromRGBO(12, 77, 162, 0.2),
          borderRadius: BorderRadius.circular(context.responsiveSize(20))),
      padding: EdgeInsets.symmetric(
          horizontal: context.responsiveSize(10),
          vertical: context.responsiveSize(5)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("CLA-1",
              style: context.textSmall!.copyWith(
                  color: Colors.blue.shade400,
                  fontSize: context.responsiveSize(20))),
          Text(
            "15/20",
            style: context.textSmall!,
          ),
        ],
      ),
    );
  }
}
