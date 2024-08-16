import 'package:campus_app/notifiers/auth_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authNotifierProvider = StateNotifierProvider((ref) {
  return AuthNotifier(ref);
});
