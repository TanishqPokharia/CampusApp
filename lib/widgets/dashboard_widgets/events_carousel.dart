import 'package:campus_app/main.dart';
import 'package:campus_app/models/event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';

class EventsCarousel extends StatelessWidget {
  const EventsCarousel({super.key, required this.events});

  final List<Event> events;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.7,
      child: FlutterCarousel(
          options: CarouselOptions(
              autoPlay: true,
              height: context.responsiveSize(250),
              showIndicator: true,
              floatingIndicator: false,
              slideIndicator: CircularWaveSlideIndicator(),
              enlargeCenterPage: true),
          items: events.map((e) {
            return Builder(
              builder: (BuildContext context) {
                return Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(
                          horizontal: context.responsiveSize(5)),
                      decoration: BoxDecoration(
                          color: Colors.indigo,
                          image: DecorationImage(
                              image: NetworkImage(e.bannerUrl),
                              fit: BoxFit.fill),
                          borderRadius: BorderRadius.circular(
                              context.responsiveSize(20))),
                    ),
                  ],
                );
              },
            );
          }).toList()),
    );
  }
}
