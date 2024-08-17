// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:campus_app/models/planner_data.dart';

class PlannerMonth {
  final List<PlannerData> plannerData;
  final List<int> holiday;
  final int holidayCount;
  PlannerMonth({
    required this.plannerData,
    required this.holiday,
    required this.holidayCount,
  });

  PlannerMonth copyWith({
    List<PlannerData>? plannerData,
    List<int>? holiday,
    int? holidayCount,
  }) {
    return PlannerMonth(
      plannerData: plannerData ?? this.plannerData,
      holiday: holiday ?? this.holiday,
      holidayCount: holidayCount ?? this.holidayCount,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'plannerData': plannerData.map((x) => x.toMap()).toList(),
      'holiday': holiday,
      'holidayCount': holidayCount,
    };
  }

  factory PlannerMonth.fromMap(Map<String, dynamic> map) {
    return PlannerMonth(
      plannerData: List<PlannerData>.from(
        (map['Data']).map<PlannerData>(
          (x) => PlannerData.fromMap(x as Map<String, dynamic>),
        ),
      ),
      holiday: List<int>.from((map['Holiday'])),
      holidayCount: map['HolidayCount'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory PlannerMonth.fromJson(String source) =>
      PlannerMonth.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'PlannerMonth(plannerData: $plannerData, holiday: $holiday, holidayCount: $holidayCount)';

  @override
  bool operator ==(covariant PlannerMonth other) {
    if (identical(this, other)) return true;

    return listEquals(other.plannerData, plannerData) &&
        listEquals(other.holiday, holiday) &&
        other.holidayCount == holidayCount;
  }

  @override
  int get hashCode =>
      plannerData.hashCode ^ holiday.hashCode ^ holidayCount.hashCode;
}
