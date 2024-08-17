import 'package:campus_app/models/event.dart';
import 'package:campus_app/providers/events/events_notifier_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final eventsProvider = FutureProvider<List<Event>>((ref) async {
  final eventsNotifier = ref.read(eventsNotifierProvider.notifier);
  return eventsNotifier.getEvents();
});
