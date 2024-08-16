import 'package:campus_app/cookie_storage.dart';
import 'package:campus_app/notifiers/user_data_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userDataNotifierProvider =
    StateNotifierProvider<UserDataNotifier, void>((ref) {
  return UserDataNotifier(CookieStorage());
});
