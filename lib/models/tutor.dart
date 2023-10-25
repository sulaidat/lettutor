class Tutor {
  String? avatarPath;
  String? name;
  String? bio;

  Tutor({
    this.avatarPath,
    this.name,
    this.bio,
  });

  Tutor.fromJson(Map<String, dynamic> json) {
    avatarPath = json['avatar'];
    name = json['name'];
    bio = json['bio'];
  }
}
