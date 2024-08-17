import 'package:campus_app/main.dart';
import 'package:campus_app/models/event.dart';
import 'package:campus_app/widgets/button.dart';
import 'package:url_launcher/url_launcher.dart';
import 'event_widgets.dart';
import 'package:flutter/material.dart';
import 'package:glass/glass.dart';

class EventCard extends StatelessWidget {
  const EventCard({super.key, required this.event});
  final Event event;
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
                image: DecorationImage(
                    fit: BoxFit.cover, image: NetworkImage(event.bannerUrl)),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(context.responsiveSize(10)),
                    topRight: Radius.circular(context.responsiveSize(10)))),
          ),
          Padding(
            padding: EdgeInsets.all(context.responsiveSize(20)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                EventHeader(
                    title: event.title,
                    organizer: "SRMKZILLA",
                    image: event.bannerUrl),
                SizedBox(
                  height: context.responsiveSize(20),
                ),
                Wrap(
                  spacing: context.responsiveSize(10),
                  runSpacing: context.responsiveSize(10),
                  children: [
                    EventTag(title: event.dates),
                    EventTag(title: event.timing),
                    if (event.odsProvided)
                      EventTag(title: "#ODs")
                    else
                      SizedBox(),
                    if (event.refreshmentsProvided)
                      EventTag(title: "#Refreshments")
                    else
                      SizedBox(),
                    ...event.labels.map((title) => EventTag(title: "#$title"))
                  ],
                ),
                SizedBox(
                  height: context.responsiveSize(20),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    EventPopularity(
                      popularity: event.popularity.toString(),
                    ),
                    GradientButton(
                      child: Text(
                        "Register",
                        style: context.textSmall!
                            .copyWith(fontSize: context.responsiveSize(20)),
                      ),
                      onPressed: () async {
                        if (await canLaunchUrl(Uri.parse(event.websiteLink))) {
                          if (!await launchUrl(Uri.parse(event.websiteLink))) {
                            throw Exception('Could not launch url');
                          }
                        }
                      },
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
