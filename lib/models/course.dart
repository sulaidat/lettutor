// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Course {
  String? name;
  String? brief;
  String? level;
  int? n_lesson;
  String? bannerUrl;

  Course({
    this.name,
    this.brief,
    this.level,
    this.n_lesson,
    this.bannerUrl,
  });

  Course copyWith({
    String? name,
    String? brief,
    String? level,
    int? n_lesson,
    String? bannerUrl,
  }) {
    return Course(
      name: name ?? this.name,
      brief: brief ?? this.brief,
      level: level ?? this.level,
      n_lesson: n_lesson ?? this.n_lesson,
      bannerUrl: bannerUrl ?? this.bannerUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'brief': brief,
      'level': level,
      'n_lesson': n_lesson,
      'bannerUrl': bannerUrl,
    };
  }

  factory Course.fromMap(Map<String, dynamic> map) {
    return Course(
      name: map['name'] != null ? map['name'] as String : null,
      brief: map['brief'] != null ? map['brief'] as String : null,
      level: map['level'] != null ? map['level'] as String : null,
      n_lesson: map['n_lesson'] != null ? map['n_lesson'] as int : null,
      bannerUrl: map['bannerUrl'] != null ? map['bannerUrl'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Course.fromJson(String source) =>
      Course.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Course(name: $name, brief: $brief, level: $level, n_lesson: $n_lesson, bannerUrl: $bannerUrl)';
  }

  @override
  bool operator ==(covariant Course other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.brief == brief &&
      other.level == level &&
      other.n_lesson == n_lesson &&
      other.bannerUrl == bannerUrl;
  }

  @override
  int get hashCode {
    return name.hashCode ^
      brief.hashCode ^
      level.hashCode ^
      n_lesson.hashCode ^
      bannerUrl.hashCode;
  }
}
