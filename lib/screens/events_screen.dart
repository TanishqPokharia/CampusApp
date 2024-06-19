import 'package:campus_app/widgets/event_widgets/event_card.dart';
import 'package:campus_app/widgets/screen_base.dart';
import 'package:flutter/material.dart';

class EventsScreen extends StatelessWidget {
  const EventsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenBase(
      title: "Events",
      child: Column(
        children: [EventCard(), EventCard()],
      ),
    );
  }
}
