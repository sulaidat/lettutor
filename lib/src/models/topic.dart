// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Topic {
  String? courseid;
  String? name;
  String? description;
  Topic({
    this.courseid,
    this.name,
    this.description,
  });

  Topic copyWith({
    String? courseid,
    String? name,
    String? description,
  }) {
    return Topic(
      courseid: courseid ?? this.courseid,
      name: name ?? this.name,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'courseid': courseid,
      'name': name,
      'description': description,
    };
  }

  factory Topic.fromMap(Map<String, dynamic> map) {
    return Topic(
      courseid: map['courseid'] != null ? map['courseid'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      description: map['description'] != null ? map['description'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Topic.fromJson(String source) => Topic.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Topic(courseid: $courseid, name: $name, description: $description)';

  @override
  bool operator ==(covariant Topic other) {
    if (identical(this, other)) return true;
  
    return 
      other.courseid == courseid &&
      other.name == name &&
      other.description == description;
  }

  @override
  int get hashCode => courseid.hashCode ^ name.hashCode ^ description.hashCode;
}
