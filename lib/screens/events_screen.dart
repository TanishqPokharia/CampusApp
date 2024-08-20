import 'package:campus_app/main.dart';
import 'package:campus_app/providers/events/events_provider.dart';
import 'package:campus_app/widgets/event_widgets/event_card.dart';
import 'package:campus_app/widgets/screen_base.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EventsScreen extends ConsumerWidget {
  const EventsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ScreenBase(
        title: "Events",
        scrollPhysics: const NeverScrollableScrollPhysics(),
        child: ref.watch(eventsProvider).when(
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
              data: (data) {
                return Container(
                  height: context.screenHeight - 280,
                  width: context.screenWidth,
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.all(context.responsiveSize(10)),
                        child: EventCard(event: data[index]),
                      );
                    },
                    separatorBuilder: (context, index) => SizedBox(
                      height: context.responsiveSize(10),
                    ),
                    itemCount: data.length,
                  ),
                );
              },
              error: (error, stackTrace) {
                print(error);
                print(stackTrace);
                return const Center(
                  child: Text("Error"),
                );
              },
            ));
  }
}
