import 'package:campus_app/models/user_data.dart';
import 'package:campus_app/providers/user_data/user_data_notifier_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userDataProvider = FutureProvider<UserData>((ref) async {
  final userDataNotifier = ref.read(userDataNotifierProvider.notifier);
  return userDataNotifier.getUserData();
});
