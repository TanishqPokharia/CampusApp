// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class PlannerData {
  final String date;
  final String day;
  final String event;
  final String dayOrder;
  PlannerData({
    required this.date,
    required this.day,
    required this.event,
    required this.dayOrder,
  });

  PlannerData copyWith({
    String? date,
    String? day,
    String? event,
    String? dayOrder,
  }) {
    return PlannerData(
      date: date ?? this.date,
      day: day ?? this.day,
      event: event ?? this.event,
      dayOrder: dayOrder ?? this.dayOrder,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'Date': date,
      'Day': day,
      'Event': event,
      'Dayorder': dayOrder,
    };
  }

  factory PlannerData.fromMap(Map<String, dynamic> map) {
    return PlannerData(
      date: map['Date'] as String,
      day: map['Day'] as String,
      event: map['Event'] as String,
      dayOrder: map['Dayorder'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PlannerData.fromJson(String source) =>
      PlannerData.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PlannerData(Date: $date, Day: $day, Event: $event, Dayorder: $dayOrder)';
  }

  @override
  bool operator ==(covariant PlannerData other) {
    if (identical(this, other)) return true;

    return other.date == date &&
        other.day == day &&
        other.event == event &&
        other.dayOrder == dayOrder;
  }

  @override
  int get hashCode {
    return date.hashCode ^ day.hashCode ^ event.hashCode ^ dayOrder.hashCode;
  }
}
