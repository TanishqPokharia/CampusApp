// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class Event {
  final String id;
  final String clubId;
  final String bannerUrl;
  final String title;
  final String websiteLink;
  final String dates;
  final String timing;
  final bool odsProvided;
  final bool refreshmentsProvided;
  final List<String> labels;
  final String createdAt;
  final String updatedAt;
  final List<String>? likedBy;
  final num popularity;
  Event({
    required this.id,
    required this.clubId,
    required this.bannerUrl,
    required this.title,
    required this.websiteLink,
    required this.dates,
    required this.timing,
    required this.odsProvided,
    required this.refreshmentsProvided,
    required this.labels,
    required this.createdAt,
    required this.updatedAt,
    this.likedBy,
    required this.popularity,
  });

  Event copyWith({
    String? id,
    String? clubId,
    String? bannerUrl,
    String? title,
    String? websiteLink,
    String? dates,
    String? timing,
    bool? odsProvided,
    bool? refreshmentsProvided,
    List<String>? labels,
    String? createdAt,
    String? updatedAt,
    List<String>? likedBy,
    num? popularity,
  }) {
    return Event(
      id: id ?? this.id,
      clubId: clubId ?? this.clubId,
      bannerUrl: bannerUrl ?? this.bannerUrl,
      title: title ?? this.title,
      websiteLink: websiteLink ?? this.websiteLink,
      dates: dates ?? this.dates,
      timing: timing ?? this.timing,
      odsProvided: odsProvided ?? this.odsProvided,
      refreshmentsProvided: refreshmentsProvided ?? this.refreshmentsProvided,
      labels: labels ?? this.labels,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      likedBy: likedBy ?? this.likedBy,
      popularity: popularity ?? this.popularity,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'ID': id,
      'ClubID': clubId,
      'banner_url': bannerUrl,
      'title': title,
      'website_link': websiteLink,
      'dates': dates,
      'timing': timing,
      'ods_provided': odsProvided,
      'refreshments_provided': refreshmentsProvided,
      'labels': labels,
      'CreatedAt': createdAt,
      'UpdatedAt': updatedAt,
      'likedby': likedBy,
      'popularity': popularity,
    };
  }

  factory Event.fromMap(Map<String, dynamic> map) {
    return Event(
      id: map['ID'] as String,
      clubId: map['ClubID'] as String,
      bannerUrl: map['banner_url'] as String,
      title: map['title'] as String,
      websiteLink: map['website_link'] as String,
      dates: map['dates'] as String,
      timing: map['timing'] as String,
      odsProvided: map['ods_provided'] as bool,
      refreshmentsProvided: map['refreshments_provided'] as bool,
      labels: List<String>.from((map['labels'])),
      createdAt: map['CreatedAt'] as String,
      updatedAt: map['UpdatedAt'] as String,
      likedBy: map['likedby'] != null
          ? List<String>.from(map['likedby'] as List)
          : null,
      popularity: map['popularity'] as num,
    );
  }

  String toJson() => json.encode(toMap());

  factory Event.fromJson(String source) =>
      Event.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Event(id: $id, clubId: $clubId, bannerUrl: $bannerUrl, title: $title, websiteLink: $websiteLink, dates: $dates, timing: $timing, odsProvided: $odsProvided, refreshmentsProvided: $refreshmentsProvided, labels: $labels, createdAt: $createdAt, updatedAt: $updatedAt, likedBy: $likedBy, popularity: $popularity)';
  }

  @override
  bool operator ==(covariant Event other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.clubId == clubId &&
        other.bannerUrl == bannerUrl &&
        other.title == title &&
        other.websiteLink == websiteLink &&
        other.dates == dates &&
        other.timing == timing &&
        other.odsProvided == odsProvided &&
        other.refreshmentsProvided == refreshmentsProvided &&
        listEquals(other.labels, labels) &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt &&
        listEquals(other.likedBy, likedBy) &&
        other.popularity == popularity;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        clubId.hashCode ^
        bannerUrl.hashCode ^
        title.hashCode ^
        websiteLink.hashCode ^
        dates.hashCode ^
        timing.hashCode ^
        odsProvided.hashCode ^
        refreshmentsProvided.hashCode ^
        labels.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode ^
        likedBy.hashCode ^
        popularity.hashCode;
  }
}
