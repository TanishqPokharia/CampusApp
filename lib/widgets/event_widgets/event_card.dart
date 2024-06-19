import 'package:campus_app/main.dart';
import 'package:campus_app/widgets/button.dart';
import 'event_widgets.dart';
import 'package:flutter/material.dart';
import 'package:glass/glass.dart';

class EventCard extends StatelessWidget {
  const EventCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      elevation: 8,
      child: Column(
        children: [
          Container(
            height: context.responsiveSize(250),
            decoration: BoxDecoration(
                color: Colors.indigo,
                image: const DecorationImage(
                    fit: BoxFit.contain, image: AssetImage("assets/Logo.png")),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(context.responsiveSize(10)),
                    topRight: Radius.circular(context.responsiveSize(10)))),
          ),
          Padding(
            padding: EdgeInsets.all(context.responsiveSize(20)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const EventHeader(
                    title: "Mozofest 2024",
                    organizer: "SRMKZILLA",
                    image: "assets/Logo.png"),
                SizedBox(
                  height: context.responsiveSize(20),
                ),
                Wrap(
                  spacing: context.responsiveSize(10),
                  runSpacing: context.responsiveSize(10),
                  children: const [
                    EventTag(title: "1.6.24 - 5.6.24"),
                    EventTag(title: "11 am to 12 pm"),
                    EventTag(title: "#ODs"),
                    EventTag(title: "#Refreshments")
                  ],
                ),
                SizedBox(
                  height: context.responsiveSize(20),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    EventPopularity(),
                    GradientButton(
                      title: "Register",
                      textStyle: context.textSmall!
                          .copyWith(fontSize: context.responsiveSize(20)),
                    )
                  ],
                )
              ],
            ),
          ).asGlass(
              tintColor: Colors.blue,
              frosted: false,
              clipBorderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(context.responsiveSize(10)),
                  bottomRight: Radius.circular(context.responsiveSize(10))))
        ],
      ),
    );
  }
}
