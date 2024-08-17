import 'package:campus_app/cookie_storage.dart';
import 'package:campus_app/notifiers/events_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final eventsNotifierProvider =
    StateNotifierProvider<EventsNotifier, void>((ref) {
  return EventsNotifier(CookieStorage());
});
