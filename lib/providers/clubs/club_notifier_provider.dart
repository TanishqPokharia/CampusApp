import 'package:campus_app/cookie_storage.dart';
import 'package:campus_app/notifiers/club_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final clubNotifierProvider = StateNotifierProvider<ClubNotifier, void>((ref) {
  return ClubNotifier(CookieStorage());
});
