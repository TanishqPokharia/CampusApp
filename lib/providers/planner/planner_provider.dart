import 'package:campus_app/models/planner_month.dart';
import 'package:campus_app/providers/planner/planner_notifier_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final plannerProvider = FutureProvider<List<PlannerMonth>>((ref) async {
  final plannerNotifier = ref.read(plannerNotifierProvider.notifier);
  return plannerNotifier.getPlanner();
});
