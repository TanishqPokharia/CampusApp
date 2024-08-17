import 'package:campus_app/cookie_storage.dart';
import 'package:campus_app/notifiers/planner_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final plannerNotifierProvider =
    StateNotifierProvider<PlannerNotifier, void>((ref) {
  return PlannerNotifier(CookieStorage());
});
