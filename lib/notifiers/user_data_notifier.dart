import 'dart:convert';

import 'package:campus_app/cookie_storage.dart';
import 'package:campus_app/models/course.dart';
import 'package:campus_app/models/test_performance.dart';
import 'package:campus_app/models/user_data.dart';
import 'package:campus_app/providers/user_data/batch_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

class UserDataNotifier extends StateNotifier<void> {
  UserDataNotifier(this.cookieStorage, this.ref) : super(());

  final CookieStorage cookieStorage;

  final Ref ref;

  Future<UserData> getUserData() async {
    final cookie = await cookieStorage.getCookie();
    try {
      final response = await http.get(
          Uri.parse("https://campusapi-puce.vercel.app/api/auth/user"),
          headers: {"X-CSRF-Token": cookie ?? ""});
      if (response.statusCode != 200) {
        throw ErrorDescription("Could not get user data");
      } else {
        final body = jsonDecode(response.body);
        final List<dynamic> testPerformances = body['testPerformances'];
        final List<dynamic> courses = body['courses'];
        ref.read(batchProvider.notifier).state = body['comboBatch'];
        final List<Course> coursesModel =
            courses.map((course) => Course.fromMap(course)).toList();
        final List<TestPerformance> testPerformancesModel = testPerformances
            .map((testPerformance) => TestPerformance.fromMap(testPerformance))
            .toList();

        return UserData(
            courses: coursesModel, testPerformances: testPerformancesModel);
      }
    } catch (e) {
      print(e);
      return UserData(courses: [], testPerformances: []);
    }
  }
}
