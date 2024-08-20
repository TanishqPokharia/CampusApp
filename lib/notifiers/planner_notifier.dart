import 'dart:convert';

import 'package:campus_app/cookie_storage.dart';
import 'package:campus_app/models/planner_month.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

class PlannerNotifier extends StateNotifier<void> {
  PlannerNotifier(this.cookieStorage) : super(());
  final CookieStorage cookieStorage;

  Future<List<PlannerMonth>> getPlanner() async {
    try {
      final cookie = await cookieStorage.getCookie();
      final response = await http.get(
          Uri.parse("https://campusapi-puce.vercel.app/api/auth/planner"),
          headers: {"X-CSRF-Token": cookie ?? ""});
      if (response.statusCode != 200) {
        throw ErrorDescription("Could not fetch planner");
      } else {
        final body = jsonDecode(response.body) as Map<String, dynamic>;
        final plannerMonthList = List.from(body.values);
        final List<PlannerMonth> planner = plannerMonthList
            .map((data) => PlannerMonth.fromMap(data)
                .copyWith(monthIndex: plannerMonthList.indexOf(data)))
            .toList();
        return planner;
      }
    } catch (e) {
      print(e);
      return [];
    }
  }
}
