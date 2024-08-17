import 'package:campus_app/main.dart';
import 'package:campus_app/models/planner_month.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:glass/glass.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key, required this.data});
  final List<PlannerMonth> data;

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  int month = DateTime.now().month;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: context.responsiveSize(20)),
          child: Container(
            padding: EdgeInsets.all(context.responsiveSize(20)),
            width: double.infinity,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                            onPressed: () {
                              setState(() {
                                if (month > 1) {
                                  month--;
                                }
                              });
                            },
                            icon: const Icon(
                              Icons.keyboard_arrow_left,
                            ))
                        .asGlass(
                            frosted: false,
                            tintColor: Colors.blue,
                            clipBorderRadius: BorderRadius.circular(
                                context.responsiveSize(100))),
                    Theme(
                      data: Theme.of(context).copyWith(
                        canvasColor: const Color.fromRGBO(11, 38, 74, 1),
                      ),
                      child: DropdownButton(
                              alignment: Alignment.center,
                              onChanged: (value) {
                                setState(() {
                                  month = value!;
                                });
                              },
                              value: month,
                              icon: SizedBox(
                                height: context.responsiveSize(50),
                                child: Column(
                                  children: [
                                    const Spacer(),
                                    SvgPicture.asset(
                                      "assets/calendar_months_drawer.svg",
                                      width: context.responsiveSize(20),
                                      height: context.responsiveSize(20),
                                    ),
                                  ],
                                ),
                              ),
                              underline: const SizedBox(),
                              padding: EdgeInsets.symmetric(
                                  horizontal: context.responsiveSize(5)),
                              borderRadius: BorderRadius.circular(
                                  context.responsiveSize(10)),
                              style: context.textSmall!.copyWith(
                                  fontSize: context.responsiveSize(20)),
                              items: {
                                "January": 1,
                                "February": 2,
                                "March": 3,
                                "April": 4,
                                "May": 5,
                                "June": 6,
                                "July": 7,
                                "August": 8,
                                "September": 9,
                                "October": 10,
                                "November": 11,
                                "December": 12
                              }
                                  .entries
                                  .map((e) => DropdownMenuItem(
                                      value: e.value,
                                      child: Container(
                                        padding: EdgeInsets.all(
                                            context.responsiveSize(10)),
                                        child: Text(e.key),
                                      )))
                                  .toList())
                          .asGlass(
                              frosted: false,
                              tintColor: Colors.blue,
                              clipBorderRadius: BorderRadius.circular(
                                  context.responsiveSize(10))),
                    ),
                    IconButton(
                            onPressed: () {
                              setState(() {
                                if (month < 12) {
                                  month++;
                                }
                              });
                            },
                            icon: const Icon(Icons.keyboard_arrow_right))
                        .asGlass(
                            frosted: false,
                            tintColor: Colors.blue,
                            clipBorderRadius: BorderRadius.circular(
                                context.responsiveSize(100)))
                  ],
                ),
                SizedBox(
                  height: context.responsiveSize(20),
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: ["Mo", "Tu", "We", "Th", "Fr", "Sat", "Su"]
                        .map((e) => Container(
                              alignment: Alignment.center,
                              width: context.responsiveSize(50),
                              margin: EdgeInsets.symmetric(
                                  horizontal: context.responsiveSize(2)),
                              child: Text(
                                e,
                                style: context.textSmall!.copyWith(
                                    fontSize: context.responsiveSize(20),
                                    color: Colors.white.withOpacity(0.3)),
                              ),
                            ))
                        .toList()),
                SizedBox(
                  height: context.responsiveSize(20),
                ),
                Wrap(
                    alignment: WrapAlignment.start,
                    spacing: context.responsiveSize(4),
                    runAlignment: WrapAlignment.spaceEvenly,
                    runSpacing: context.responsiveSize(5),
                    children: getCalendarLayout())
              ],
            ),
          ).asGlass(
              tintColor: Colors.blue.shade500,
              frosted: false,
              clipBorderRadius:
                  BorderRadius.circular(context.responsiveSize(10))),
        ),
        Padding(
          padding: EdgeInsets.only(
              left: context.responsiveSize(20),
              top: context.responsiveSize(10)),
          child: Text(
            widget.data[DateTime.now().month - 1].plannerData.isEmpty ||
                    widget.data[month - 1].plannerData[DateTime.now().day - 1]
                        .event.isEmpty
                ? "Nothing Today"
                : widget.data[DateTime.now().month - 1]
                    .plannerData[DateTime.now().day - 1].event,
            style: context.textMedium!.copyWith(color: Colors.blue.shade600),
          ),
        ),
      ],
    );
  }

  List<Widget> getCalendarLayout() {
    final List<Widget> layout = [];
    print(widget.data);
    if (widget.data.isEmpty || widget.data[month - 1].plannerData.isEmpty)
      return layout;
    final day = widget.data[month - 1].plannerData.first.day;
    switch (day) {
      case "Mon":
        break;
      case "Tue":
        layout.add(Container(
            width: context.responsiveSize(50),
            padding: EdgeInsets.all(context.responsiveSize(10))));
        break;
      case "Wed":
        layout.addAll([
          for (int i = 0; i < 2; i++)
            Container(
                width: context.responsiveSize(50),
                padding: EdgeInsets.all(context.responsiveSize(10)))
        ]);
        break;
      case "Thu":
        layout.addAll([
          for (int i = 0; i < 3; i++)
            Container(
                width: context.responsiveSize(50),
                padding: EdgeInsets.all(context.responsiveSize(10)))
        ]);
        break;
      case "Fri":
        layout.addAll([
          for (int i = 0; i < 4; i++)
            Container(
                width: context.responsiveSize(50),
                padding: EdgeInsets.all(context.responsiveSize(10)))
        ]);
        break;
      case "Sat":
        layout.addAll([
          for (int i = 0; i < 5; i++)
            Container(
                width: context.responsiveSize(50),
                padding: EdgeInsets.all(context.responsiveSize(10)))
        ]);
        break;
      case "Sun":
        layout.addAll([
          for (int i = 0; i < 6; i++)
            Container(
                width: context.responsiveSize(50),
                padding: EdgeInsets.all(context.responsiveSize(10)))
        ]);
        break;
      default:
        break;
    }

    layout.addAll(widget.data[month - 1].plannerData.map((e) {
      late Color color;
      if (int.parse(e.date) == DateTime.now().day) {
        color = Colors.purple.withOpacity(0.8);
      } else if (widget.data[month - 1].holiday.contains(int.parse(e.date))) {
        color = Colors.green.withOpacity(0.8);
      } else {
        color = const Color.fromRGBO(41, 117, 218, 0.611).withOpacity(0.2);
      }
      return GestureDetector(
        onTap: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return Container(
                height: context.screenHeight / 2,
              );
            },
          );
        },
        child: Container(
          alignment: Alignment.center,
          width: context.responsiveSize(50),
          decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(context.responsiveSize(10))),
          padding: EdgeInsets.all(context.responsiveSize(10)),
          child: Text(e.date),
        ),
      );
    }));
    return layout;
  }
}
