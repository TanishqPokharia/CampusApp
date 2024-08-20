import 'package:campus_app/main.dart';
import 'package:flutter/material.dart';
import 'package:glass/glass.dart';

class ClassesLeftWidget extends StatefulWidget {
  const ClassesLeftWidget({super.key});

  @override
  State<ClassesLeftWidget> createState() => _ClassesLeftWidgetState();
}

class _ClassesLeftWidgetState extends State<ClassesLeftWidget> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isExpanded = !isExpanded;
        });
      },
      child: AnimatedContainer(
        width: context.responsiveSize(isExpanded ? 300 : 80),
        curve: Curves.ease,
        duration: const Duration(milliseconds: 500),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(context.responsiveSize(10)),
              child: Text(
                "Environmental Science",
                style: context.textSmall!.copyWith(
                  color: Colors.blue.shade600,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(context.responsiveSize(10)),
              child: Text("5"),
            )
          ],
        ).asGlass(
            frosted: false,
            tintColor: Colors.blue,
            clipBorderRadius:
                BorderRadius.circular(context.responsiveSize(20))),
      ),
    );
  }
}
