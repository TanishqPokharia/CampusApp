import 'package:campus_app/main.dart';
import 'package:campus_app/widgets/marks_widgets/ct_marks_widget.dart';
import 'package:flutter/material.dart';

import 'marks_graph_widget.dart';

class MarksWidget extends StatelessWidget {
  const MarksWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.responsiveSize(420),
      width: context.responsiveSize(390),
      padding: EdgeInsets.all(context.responsiveSize(18)),
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
                height: context.responsiveSize(70),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Semiconductor Physics and Computational Model",
                      style: TextStyle(
                        fontSize: context.responsiveSize(16),
                        fontWeight: FontWeight.w400,
                      ),
                      maxLines: 2,
                      softWrap: true,
                    ),
                    Text(
                      "21PYB102J",
                      style: context.textSmall,
                    ),
                  ],
                ),
              ),
              Text(
                "45/60",
                style: TextStyle(
                  fontSize: context.responsiveSize(36),
                  color: const Color.fromRGBO(0, 148, 255, 1),
                  fontWeight: FontWeight.w700,
                ),
              )
            ],
          ),
          SizedBox(height: context.responsiveSize(10)),
          Expanded(
            child: const MarksGraphWidget(),
          ),
          Expanded(
            child:
              ClipRect(
                child: GridView.count(
                  shrinkWrap: true,
                  physics:AlwaysScrollableScrollPhysics(),
                  crossAxisCount: 3,
                  childAspectRatio: 1.5,
                  children: [
                    CtMarksWidgetCard(),
                    CtMarksWidgetCard(),
                    CtMarksWidgetCard(),
                    CtMarksWidgetCard(),
                    CtMarksWidgetCard(),
                  ],
                ),
              ),
          ),
        ],
      ),
    );
  }
}
