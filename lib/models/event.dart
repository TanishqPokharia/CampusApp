// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class Event {
  final String id;
  final String clubId;
  final String clubName;
  final String bannerUrl;
  final String title;
  final String? websiteLink;
  final String dates;
  final String timing;
  final bool odsProvided;
  final bool refreshmentsProvided;
  final List<String> labels;
  final String logo;
  final String createdAt;
  final String updatedAt;
  final List<String>? likedBy;
  final num? popularity;
  Event({
    required this.id,
    required this.clubId,
    required this.clubName,
    required this.bannerUrl,
    required this.title,
    this.websiteLink,
    required this.dates,
    required this.timing,
    this.odsProvided = false,
    this.refreshmentsProvided = false,
    required this.labels,
    required this.logo,
    required this.createdAt,
    required this.updatedAt,
    this.likedBy,
    this.popularity,
  });

  Event copyWith({
    String? id,
    String? club_id,
    String? club_name,
    String? banner_url,
    String? title,
    String? website_ink,
    String? dates,
    String? timing,
    bool? ods_provided,
    bool? refreshments_provided,
    List<String>? Labels,
    String? logo,
    String? created_at,
    String? updated_at,
    List<String>? likedBy,
    num? popularity,
  }) {
    return Event(
      id: id ?? this.id,
      clubId: club_id ?? this.clubId,
      clubName: club_name ?? this.clubName,
      bannerUrl: banner_url ?? this.bannerUrl,
      title: title ?? this.title,
      websiteLink: website_ink ?? this.websiteLink,
      dates: dates ?? this.dates,
      timing: timing ?? this.timing,
      odsProvided: ods_provided ?? this.odsProvided,
      refreshmentsProvided: refreshments_provided ?? this.refreshmentsProvided,
      labels: Labels ?? this.labels,
      logo: logo ?? this.logo,
      createdAt: created_at ?? this.createdAt,
      updatedAt: updated_at ?? this.updatedAt,
      likedBy: likedBy ?? this.likedBy,
      popularity: popularity ?? this.popularity,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'club_id': clubId,
      'club_name': clubName,
      'banner_url': bannerUrl,
      'title': title,
      'website_link': websiteLink,
      'dates': dates,
      'timing': timing,
      'ods_provided': odsProvided,
      'refreshments_provided': refreshmentsProvided,
      'Labels': labels,
      'logo': logo,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'likedBy': likedBy,
      'popularity': popularity,
    };
  }

  factory Event.fromMap(Map<String, dynamic> map) {
    return Event(
      id: map['id'] as String,
      clubId: map['club_id'] as String,
      clubName: map['club_name'] as String,
      bannerUrl: map['banner_url'] as String,
      title: map['title'] as String,
      websiteLink:
          map['website_link'] != null ? map['website_link'] as String : null,
      dates: map['dates'] as String,
      timing: map['timing'] as String,
      odsProvided: map['ods_provided'] ?? false,
      refreshmentsProvided: map['refreshments_provided'] ?? false,
      labels: List<String>.from((map['Labels'])),
      logo: map['logo'] as String,
      createdAt: map['created_at'] as String,
      updatedAt: map['updated_at'] as String,
      likedBy: map['likedBy'] != null ? List.from((map['likedBy'])) : null,
      popularity: map['popularity'] != null ? map['popularity'] as num : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Event.fromJson(String source) =>
      Event.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Event(id: $id, club_id: $clubId, banner_url: $bannerUrl, title: $title, website_ink: $websiteLink, dates: $dates, timing: $timing, ods_provided: $odsProvided, refreshments_provided: $refreshmentsProvided, Labels: $labels, logo: $logo, created_at: $createdAt, updated_at: $updatedAt, likedBy: $likedBy, popularity: $popularity)';
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
        other.logo == logo &&
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
        logo.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode ^
        likedBy.hashCode ^
        popularity.hashCode;
  }
}
