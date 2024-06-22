import 'package:campus_app/main.dart';
import 'package:campus_app/widgets/planner_widgets/calendar.dart';
import 'package:campus_app/widgets/planner_widgets/classes_left.dart';
import 'package:campus_app/widgets/planner_widgets/date_selector.dart';
import 'package:campus_app/widgets/screen_base.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:glass/glass.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenBase(
      title: "Planner",
      child: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Calendar(),
            Padding(
              padding: EdgeInsets.only(
                  left: context.responsiveSize(20),
                  top: context.responsiveSize(10)),
              child: Text(
                "Nothing Today",
                style:
                    context.textMedium!.copyWith(color: Colors.blue.shade600),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: context.responsiveSize(20)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Select dates to plan your holiday",
                    style: context.textSmall!
                        .copyWith(color: Colors.blue.shade100.withOpacity(0.5)),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.info_outline_rounded,
                        size: context.responsiveSize(20),
                        color: Colors.blue.shade600,
                      )),
                ],
              ),
            ),
            DateSelector(),
            Padding(
              padding: EdgeInsets.only(
                  left: context.responsiveSize(10),
                  top: context.responsiveSize(20)),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(context.responsiveSize(20)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Classes Left",
                      style: context.textMedium!.copyWith(
                          color: Colors.blue.shade100,
                          fontSize: context.responsiveSize(20)),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: context.responsiveSize(20),
                          horizontal: context.responsiveSize(20)),
                      child: Wrap(
                        spacing: context.responsiveSize(20),
                        runSpacing: context.responsiveSize(20),
                        children: [
                          ClassesLeftWidget(),
                          ClassesLeftWidget(),
                          ClassesLeftWidget(),
                          ClassesLeftWidget()
                        ],
                      ),
                    )
                  ],
                ),
              ).asGlass(
                  frosted: false,
                  tintColor: Colors.blue,
                  clipBorderRadius:
                      BorderRadius.circular(context.responsiveSize(10))),
            )
          ],
        ),
      ),
    );
  }
}
