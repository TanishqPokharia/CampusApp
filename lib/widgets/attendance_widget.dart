// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:campus_app/models/course.dart';
import 'package:flutter/material.dart';
import 'package:glass/glass.dart';

import 'package:campus_app/main.dart';

class StatCard extends StatelessWidget {
  const StatCard({
    super.key,
    required this.type,
    required this.value,
    required this.color,
  });
  final String type;
  final Color color;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.responsiveSize(64),
      height: context.responsiveSize(31),
      alignment: Alignment.center,
      child: Card(
        color: Color.fromRGBO(12, 77, 162, 0.2),
        elevation: context.responsiveSize(5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(context.responsiveSize(15)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              type,
              style: context.textSmall!.copyWith(color: color),
              softWrap: true,
            ),
            Text(
              value,
              style: context.textSmall!.copyWith(color: color),
              softWrap: true,
            ),
          ],
        ),
      ),
    );
  }
}

class AttendanceWidget extends StatelessWidget {
  final Course course;
  const AttendanceWidget({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return Container(
            padding: EdgeInsets.all(context.responsiveSize(20)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            course.courseTitle,
                            style: context.textMedium,
                            softWrap: true,
                          ),
                          Row(
                            spacing: context.responsiveSize(20),
                            children: [
                              Text(
                                course.courseCode.substring(0, 9),
                                style: context.textSmall,
                              ),
                              Text(
                                course.courseCode.substring(9),
                                style: context.textSmall,
                              ),
                              Text(
                                course.category,
                                style: context.textSmall,
                              )
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                top: context.responsiveSize(10)),
                            width: context.responsiveSize(196),
                            height: context.responsiveSize(31),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                StatCard(
                                  type: "T",
                                  value:
                                      " ${double.parse(course.hoursConducted).toInt()}",
                                  color: Colors.white,
                                ),
                                StatCard(
                                  type: "P",
                                  value:
                                      " ${double.parse(course.hoursPresent).toInt()}",
                                  color: Colors.green,
                                ),
                                StatCard(
                                  type: "A",
                                  value:
                                      " ${double.parse(course.hoursAbsent).toInt()}",
                                  color: Colors.red,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        children: [
                          Text(
                            course.required <= 0
                                ? course.margin.toString()
                                : course.required.toString(),
                            style: TextStyle(
                                fontSize: context.responsiveSize(36),
                                fontWeight: FontWeight.w700,
                                color: course.required <= 0
                                    ? Colors.green.shade600
                                    : Colors.red),
                          ),
                          Text(course.required <= 0 ? "Margin" : "Required",
                              style: TextStyle(
                                  fontSize: context.responsiveSize(12),
                                  fontWeight: FontWeight.w700,
                                  color: course.required <= 0
                                      ? Colors.green.shade600
                                      : Colors.red)),
                          Text("${course.attendancePercent}%",
                              style: TextStyle(
                                fontSize: context.responsiveSize(16),
                                fontWeight: FontWeight.w700,
                                color: const Color.fromRGBO(0, 148, 255, 1),
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(context.responsiveSize(20)),
                  child: Stack(
                    alignment: Alignment.centerLeft,
                    children: [
                      Container(
                        width: context.responsiveSize(400),
                        height: context.responsiveSize(3),
                        color: const Color.fromRGBO(0, 64, 111, 1),
                      ),
                      Container(
                        width: context.responsiveSize(
                            (double.parse(course.hoursPresent)) /
                                (double.parse(course.hoursConducted)) *
                                400),
                        height: context.responsiveSize(3),
                        color: const Color.fromRGBO(0, 255, 56, 1),
                      ),
                      Container(
                        width: context.responsiveSize(4),
                        height: context.responsiveSize(11),
                        margin: EdgeInsets.only(
                            left: context.responsiveSize(
                                (double.parse(course.hoursPresent)) /
                                    (double.parse(course.hoursConducted)) *
                                    400)),
                        color: const Color.fromRGBO(0, 148, 255, 1),
                      )
                    ],
                  ),
                )
              ],
            ))
        .asGlass(
            tintColor: Colors.blue,
            frosted: false,
            clipBorderRadius:
                BorderRadius.circular(context.responsiveSize(20)));
  }
}
