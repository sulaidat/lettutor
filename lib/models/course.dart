// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:lettutor/models/topic.dart';

class Course {
  String? name;
  String? brief;
  String? level;
  List<Topic> topics;
  String? bannerUrl;

  Course({
    this.name,
    this.brief,
    this.level,
    required this.topics,
    this.bannerUrl,
  });

  Course copyWith({
    String? name,
    String? brief,
    String? level,
    List<Topic>? topis,
    String? bannerUrl,
  }) {
    return Course(
      name: name ?? this.name,
      brief: brief ?? this.brief,
      level: level ?? this.level,
      topics: topis ?? this.topics,
      bannerUrl: bannerUrl ?? this.bannerUrl,
    );
  }

  factory Course.fromMap(Map<String, dynamic> map) {
    return Course(
      name: map['name'] != null ? map['name'] as String : null,
      brief: map['brief'] != null ? map['brief'] as String : null,
      level: map['level'] != null ? map['level'] as String : null,
      topics: List<Topic>.from(
        (map['topis'] as List<int>).map<Topic>(
          (x) => Topic.fromMap(x as Map<String, dynamic>),
        ),
      ),
      bannerUrl: map['bannerUrl'] != null ? map['bannerUrl'] as String : null,
    );
  }

  factory Course.fromJson(String source) =>
      Course.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Course(name: $name, brief: $brief, level: $level, topis: $topics, bannerUrl: $bannerUrl)';
  }

  @override
  bool operator ==(covariant Course other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.brief == brief &&
        other.level == level &&
        listEquals(other.topics, topics) &&
        other.bannerUrl == bannerUrl;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        brief.hashCode ^
        level.hashCode ^
        topics.hashCode ^
        bannerUrl.hashCode;
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'brief': brief,
      'level': level,
      'topis': topics.map((x) => x.toMap()).toList(),
      'bannerUrl': bannerUrl,
    };
  }

  String toJson() => json.encode(toMap());
}
