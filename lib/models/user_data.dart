// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:campus_app/models/courses.dart';
import 'package:campus_app/models/test_performance.dart';

class UserData {
  final List<Courses> courses;
  final List<TestPerformance> testPerformances;
  UserData({
    required this.courses,
    required this.testPerformances,
  });
}
