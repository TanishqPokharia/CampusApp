// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class TestPerformance {
  final String courseCode;
  final String courseType;
  final String courseName;
  final Map<dynamic, dynamic> tests;
  final num totalMarkGot;
  final num totalMarks;
  TestPerformance({
    required this.courseCode,
    required this.courseType,
    required this.courseName,
    required this.tests,
    required this.totalMarkGot,
    required this.totalMarks,
  });

  TestPerformance copyWith({
    String? courseCode,
    String? courseType,
    String? courseName,
    Map<dynamic, dynamic>? tests,
    num? totalMarkGot,
    num? totalMarks,
  }) {
    return TestPerformance(
      courseCode: courseCode ?? this.courseCode,
      courseType: courseType ?? this.courseType,
      courseName: courseName ?? this.courseName,
      tests: tests ?? this.tests,
      totalMarkGot: totalMarkGot ?? this.totalMarkGot,
      totalMarks: totalMarks ?? this.totalMarks,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'courseCode': courseCode,
      'courseType': courseType,
      'courseName': courseName,
      'tests': tests,
      'totalMarkGot': totalMarkGot,
      'totalMarks': totalMarks,
    };
  }

  factory TestPerformance.fromMap(Map<String, dynamic> map) {
    return TestPerformance(
      courseCode: map['courseCode'] as String,
      courseType: map['courseType'] as String,
      courseName: map['courseName'] as String,
      tests:
          Map<dynamic, dynamic>.from((map['tests'] as Map<dynamic, dynamic>)),
      totalMarkGot: map['totalMarkGot'] as num,
      totalMarks: map['totalMarks'] as num,
    );
  }

  String toJson() => json.encode(toMap());

  factory TestPerformance.fromJson(String source) =>
      TestPerformance.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'TestPerformance(courseCode: $courseCode, courseType: $courseType, courseName: $courseName, tests: $tests, totalMarkGot: $totalMarkGot, totalMarks: $totalMarks)';
  }

  @override
  bool operator ==(covariant TestPerformance other) {
    if (identical(this, other)) return true;

    return other.courseCode == courseCode &&
        other.courseType == courseType &&
        other.courseName == courseName &&
        mapEquals(other.tests, tests) &&
        other.totalMarkGot == totalMarkGot &&
        other.totalMarks == totalMarks;
  }

  @override
  int get hashCode {
    return courseCode.hashCode ^
        courseType.hashCode ^
        courseName.hashCode ^
        tests.hashCode ^
        totalMarkGot.hashCode ^
        totalMarks.hashCode;
  }
}
