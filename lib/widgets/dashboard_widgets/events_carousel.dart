import 'package:campus_app/main.dart';
import 'package:campus_app/models/event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';

class EventsCarousel extends StatelessWidget {
  const EventsCarousel({super.key, required this.events});

  final List<Event> events;

  @override
  Widget build(BuildContext context) {
    return FlutterCarousel(
        options: CarouselOptions(
          height: context.responsiveSize(250),
          showIndicator: true,
          slideIndicator: CircularSlideIndicator(),
        ),
        items: events.map((e) {
          return Builder(
            builder: (BuildContext context) {
              return Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                        color: Colors.indigo,
                        image: DecorationImage(
                            image: NetworkImage(e.bannerUrl),
                            fit: BoxFit.cover),
                        borderRadius:
                            BorderRadius.circular(context.responsiveSize(20))),
                  ),
                  Container(
                    height: context.responsiveSize(30),
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.7),
                        borderRadius:
                            BorderRadius.circular(context.responsiveSize(10))),
                  ),
                ],
              );
            },
          );
        }).toList());
  }
}
