// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Tutor {
  Tutor({
    this.name,
    this.bio,
    this.imageUrl,
    this.introVideoUrl,
  });

  factory Tutor.fromJson(String source) => Tutor.fromMap(json.decode(source) as Map<String, dynamic>);

  factory Tutor.fromMap(Map<String, dynamic> map) {
    return Tutor(
      name: map['name'] != null ? map['name'] as String : null,
      bio: map['bio'] != null ? map['bio'] as String : null,
      imageUrl: map['imageUrl'] != null ? map['imageUrl'] as String : null,
      introVideoUrl: map['introVideoUrl'] != null ? map['introVideoUrl'] as String : null,
    );
  }

  String? bio;
  String? imageUrl;
  String? introVideoUrl;
  String? name;

  @override
  bool operator ==(covariant Tutor other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.bio == bio &&
      other.imageUrl == imageUrl &&
      other.introVideoUrl == introVideoUrl;
  }

  @override
  int get hashCode {
    return name.hashCode ^
      bio.hashCode ^
      imageUrl.hashCode ^
      introVideoUrl.hashCode;
  }

  @override
  String toString() {
    return 'Tutor(name: $name, bio: $bio, imageUrl: $imageUrl, introVideoUrl: $introVideoUrl)';
  }

  Tutor copyWith({
    String? name,
    String? bio,
    String? imageUrl,
    String? introVideoUrl,
  }) {
    return Tutor(
      name: name ?? this.name,
      bio: bio ?? this.bio,
      imageUrl: imageUrl ?? this.imageUrl,
      introVideoUrl: introVideoUrl ?? this.introVideoUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'bio': bio,
      'imageUrl': imageUrl,
      'introVideoUrl': introVideoUrl,
    };
  }

  String toJson() => json.encode(toMap());
}
