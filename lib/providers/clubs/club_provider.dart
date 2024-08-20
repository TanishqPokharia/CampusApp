import 'package:campus_app/models/club.dart';
import 'package:campus_app/providers/clubs/club_notifier_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final clubProvider = FutureProvider<List<Club>>((ref) async {
  final clubNotifier = ref.read(clubNotifierProvider.notifier);
  return clubNotifier.getClubs();
});
