// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class Club {
  final String id;
  final String name;
  final String description;
  final String email;
  final String? websiteLink;
  final bool? isRecruiting;
  final List<String> labels;
  final String logo;
  final String createdAt;
  final String updatedAt;
  Club({
    required this.id,
    required this.name,
    required this.description,
    required this.email,
    this.websiteLink,
    this.isRecruiting = false,
    required this.labels,
    required this.logo,
    required this.createdAt,
    required this.updatedAt,
  });

  Club copyWith({
    String? id,
    String? name,
    String? description,
    String? email,
    String? websiteLink,
    bool? isRecruiting,
    List<String>? labels,
    String? logo,
    String? created_at,
    String? updated_at,
  }) {
    return Club(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      email: email ?? this.email,
      websiteLink: websiteLink ?? this.websiteLink,
      isRecruiting: isRecruiting ?? this.isRecruiting,
      labels: labels ?? this.labels,
      logo: logo ?? this.logo,
      createdAt: created_at ?? this.createdAt,
      updatedAt: updated_at ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'email': email,
      'websiteLink': websiteLink,
      'isRecruiting': isRecruiting,
      'labels': labels,
      'logo': logo,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }

  factory Club.fromMap(Map<String, dynamic> map) {
    return Club(
      id: map['id'] as String,
      name: map['name'] as String,
      description: map['description'] as String,
      email: map['email'] as String,
      websiteLink:
          map['websiteLink'] != null ? map['websiteLink'] as String : null,
      isRecruiting:
          map['isRecruiting'] != null ? map['isRecruiting'] as bool : false,
      labels: List<String>.from((map['labels'] as List)),
      logo: map['logo'] as String,
      createdAt: map['created_at'] as String,
      updatedAt: map['updated_at'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Club.fromJson(String source) =>
      Club.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Club(id: $id, name: $name, description: $description, email: $email, websiteLink: $websiteLink, isRecruiting: $isRecruiting, labels: $labels, logo: $logo, created_at: $createdAt, updated_at: $updatedAt)';
  }

  @override
  bool operator ==(covariant Club other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.description == description &&
        other.email == email &&
        other.websiteLink == websiteLink &&
        other.isRecruiting == isRecruiting &&
        listEquals(other.labels, labels) &&
        other.logo == logo &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        description.hashCode ^
        email.hashCode ^
        websiteLink.hashCode ^
        isRecruiting.hashCode ^
        labels.hashCode ^
        logo.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode;
  }
}
