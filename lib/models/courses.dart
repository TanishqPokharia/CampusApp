// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Courses {
  final String courseCode;
  final String courseTitle;
  final String category;
  final String facultyName;
  final String slot;
  final String hoursConducted;
  final String hoursAbsent;
  final num margin;
  final num required;
  final String attendancePercent;
  final String practicalDetails;
  Courses({
    required this.courseCode,
    required this.courseTitle,
    required this.category,
    required this.facultyName,
    required this.slot,
    required this.hoursConducted,
    required this.hoursAbsent,
    required this.margin,
    required this.required,
    required this.attendancePercent,
    required this.practicalDetails,
  });

  Courses copyWith({
    String? courseCode,
    String? courseTitle,
    String? category,
    String? facultyName,
    String? slot,
    String? hoursConducted,
    String? hoursAbsent,
    num? margin,
    num? required,
    String? attendancePercent,
    String? practicalDetails,
  }) {
    return Courses(
      courseCode: courseCode ?? this.courseCode,
      courseTitle: courseTitle ?? this.courseTitle,
      category: category ?? this.category,
      facultyName: facultyName ?? this.facultyName,
      slot: slot ?? this.slot,
      hoursConducted: hoursConducted ?? this.hoursConducted,
      hoursAbsent: hoursAbsent ?? this.hoursAbsent,
      margin: margin ?? this.margin,
      required: required ?? this.required,
      attendancePercent: attendancePercent ?? this.attendancePercent,
      practicalDetails: practicalDetails ?? this.practicalDetails,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'courseCode': courseCode,
      'courseTitle': courseTitle,
      'category': category,
      'facultyName': facultyName,
      'slot': slot,
      'hoursConducted': hoursConducted,
      'hoursAbsent': hoursAbsent,
      'margin': margin,
      'required': required,
      'attendancePercent': attendancePercent,
      'practicalDetails': practicalDetails,
    };
  }

  factory Courses.fromMap(Map<String, dynamic> map) {
    return Courses(
      courseCode: map['courseCode'] as String,
      courseTitle: map['courseTitle'] as String,
      category: map['category'] as String,
      facultyName: map['facultyName'] as String,
      slot: map['slot'] as String,
      hoursConducted: map['hoursConducted'] as String,
      hoursAbsent: map['hoursAbsent'] as String,
      margin: map['margin'] as num,
      required: map['required'] as num,
      attendancePercent: map['attendancePercent'] as String,
      practicalDetails: map['practicalDetails'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Courses.fromJson(String source) =>
      Courses.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Courses(courseCode: $courseCode, courseTitle: $courseTitle, category: $category, facultyName: $facultyName, slot: $slot, hoursConducted: $hoursConducted, hoursAbsent: $hoursAbsent, margin: $margin, required: $required, attendancePercent: $attendancePercent, practicalDetails: $practicalDetails)';
  }

  @override
  bool operator ==(covariant Courses other) {
    if (identical(this, other)) return true;

    return other.courseCode == courseCode &&
        other.courseTitle == courseTitle &&
        other.category == category &&
        other.facultyName == facultyName &&
        other.slot == slot &&
        other.hoursConducted == hoursConducted &&
        other.hoursAbsent == hoursAbsent &&
        other.margin == margin &&
        other.required == required &&
        other.attendancePercent == attendancePercent &&
        other.practicalDetails == practicalDetails;
  }

  @override
  int get hashCode {
    return courseCode.hashCode ^
        courseTitle.hashCode ^
        category.hashCode ^
        facultyName.hashCode ^
        slot.hashCode ^
        hoursConducted.hashCode ^
        hoursAbsent.hashCode ^
        margin.hashCode ^
        required.hashCode ^
        attendancePercent.hashCode ^
        practicalDetails.hashCode;
  }
}
