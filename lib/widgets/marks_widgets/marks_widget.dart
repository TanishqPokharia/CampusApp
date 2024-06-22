import 'package:campus_app/main.dart';
import 'package:campus_app/widgets/marks_widgets/ct_marks_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

import 'marks_graph_widget.dart';

class MarksWidget extends StatelessWidget {
  const MarksWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(context.responsiveSize(10)),
      padding: EdgeInsets.all(context.responsiveSize(30)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: const Color.fromRGBO(12, 77, 162, 0.2),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: context.responsiveSize(235),
                height: context.responsiveSize(90),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Semiconductor Physics and Computational Model",
                      style: context.textSmall!.copyWith(
                        fontSize: context.responsiveSize(20),
                        fontWeight: FontWeight.w400,
                      ),
                      maxLines: 2,
                      softWrap: true,
                    ),
                    Text(
                      "21PYB102J",
                      style: context.textSmall!.copyWith(
                          color: Colors.white.withOpacity(0.4),
                          fontSize: context.responsiveSize(18)),
                    ),
                  ],
                ),
              ),
              Text.rich(TextSpan(children: [
                TextSpan(
                    text: "45",
                    style: context.textLarge!.copyWith(
                        color: Colors.blue.shade400,
                        fontSize: context.responsiveSize(50))),
                TextSpan(
                    text: "/60",
                    style: context.textMedium!
                        .copyWith(color: Colors.blue.shade400))
              ]))
            ],
          ),
          SizedBox(height: context.responsiveSize(10)),
          SizedBox(
            height: context.responsiveSize(150),
            child: const MarksGraphWidget(),
          ),
          SizedBox(
            height: context.responsiveSize(20),
          ),
          Container(
            padding: EdgeInsets.only(left: context.responsiveSize(10)),
            alignment: Alignment.centerLeft,
            child: Wrap(
              spacing: context.responsiveSize(20),
              runSpacing: context.responsiveSize(10),
              children: const [
                CtMarksWidgetCard(),
                CtMarksWidgetCard(),
                CtMarksWidgetCard(),
                CtMarksWidgetCard(),
                CtMarksWidgetCard(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
