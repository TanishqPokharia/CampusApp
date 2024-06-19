import 'dart:io';

import 'package:flutter/material.dart';
import 'package:glass/glass.dart';
import 'package:campus_app/main.dart';

class StatCard extends StatelessWidget {
  const StatCard({super.key});
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
              "P",
              style: context.textSmall,
              softWrap: true,
            ),
            Text(
              "20",
              style: context.textSmall,
              softWrap: true,
            ),
          ],
        ),
      ),
    );
  }
}

class AttendanceWidget extends StatelessWidget {
  const AttendanceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
            padding: EdgeInsets.all(context.responsiveSize(18)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Environmental Science",
                          style: context.textMedium,
                          softWrap: true,
                        ),
                        Text(
                          "21PYB102J",
                          style: context.textSmall,
                        ),
                        Container(
                          margin: EdgeInsets.only(top: context.responsiveSize(10)),
                          width: context.responsiveSize(196),
                          height: context.responsiveSize(31),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              StatCard(),
                              StatCard(),
                              StatCard(),
                            ],
                          ),
                        )
                      ],
                    ),
                    Container(
                      width: context.responsiveSize(62),
                      height: context.responsiveSize(97),
                      child: Column(
                        children: [
                          Text(
                            "4",
                            style: TextStyle(
                                fontSize: context.responsiveSize(36),
                                fontWeight: FontWeight.w700,
                                color: Colors.green.shade600),
                          ),
                          Text("Margin",
                              style: TextStyle(
                                  fontSize: context.responsiveSize(12),
                                  fontWeight: FontWeight.w700,
                                  color: Colors.green.shade600)),
                          Text("90.91%",
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
                Stack(
                  alignment: Alignment.centerLeft,
                  children: [
                    Container(
                      width: context.responsiveSize(328),
                      height: context.responsiveSize(3),
                      color: Color.fromRGBO(0, 64, 111, 1),
                    ),
                    Container(
                      width: context.responsiveSize(298.18),
                      height: context.responsiveSize(3),
                      color: Color.fromRGBO(0, 255, 56, 1),
                    ),
                    Container(
                      width: context.responsiveSize(4),
                      height: context.responsiveSize(11),
                      margin: EdgeInsets.only(left: 246),
                      color: Color.fromRGBO(0, 148, 255, 1),
                    )
                  ],
                )
              ],
            ))
        .asGlass(
            tintColor: Colors.indigo.shade500,
            clipBorderRadius:
                BorderRadius.circular(context.responsiveSize(20)));
  }
}
