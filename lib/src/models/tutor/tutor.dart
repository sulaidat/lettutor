import 'package:lettutor/src/models/user/user.dart';

class Tutor {
  // bool? isFavoriteTutor;

  Tutor({
    level,
    email,
    google,
    facebook,
    apple,
    avatar,
    name,
    country,
    phone,
    language,
    birthday,
    requestPassword,
    isActivated,
    isPhoneActivated,
    requireNote,
    timezone,
    phoneAuth,
    isPhoneAuthActivated,
    studySchedule,
    canSendMessage,
    isPublicRecord,
    caredByStaffId,
    createdAt,
    updatedAt,
    deletedAt,
    studentGroupId,
    feedbacks,
    id,
    userId,
    video,
    bio,
    education,
    experience,
    profession,
    accent,
    targetStudent,
    interests,
    languages,
    specialties,
    resume,
    rating,
    isNative,
    price,
    isOnline,
    user,
  });

  Tutor.fromJson(Map<String, dynamic> json) {
    level = json['level'];
    email = json['email'];
    google = json['google'];
    facebook = json['facebook'];
    apple = json['apple'];
    avatar = json['avatar'];
    name = json['name'];
    country = json['country'];
    phone = json['phone'];
    language = json['language'];
    birthday = json['birthday'];
    requestPassword = json['requestPassword'];
    isActivated = json['isActivated'];
    isPhoneActivated = json['isPhoneActivated'];
    requireNote = json['requireNote'];
    timezone = json['timezone'];
    phoneAuth = json['phoneAuth'];
    isPhoneAuthActivated = json['isPhoneAuthActivated'];
    studySchedule = json['studySchedule'];
    canSendMessage = json['canSendMessage'];
    isPublicRecord = json['isPublicRecord'];
    caredByStaffId = json['caredByStaffId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    deletedAt = json['deletedAt'];
    studentGroupId = json['studentGroupId'];
    if (json['feedbacks'] != null) {
      feedbacks = <Feedbacks>[];
      json['feedbacks'].forEach((v) {
        feedbacks!.add(Feedbacks.fromJson(v));
      });
    }
    id = json['id'];
    userId = json['userId'];
    video = json['video'];
    bio = json['bio'];
    education = json['education'];
    experience = json['experience'];
    profession = json['profession'];
    accent = json['accent'];
    targetStudent = json['targetStudent'];
    interests = json['interests'];
    languages = json['languages'];
    specialties = json['specialties'];
    resume = json['resume'];
    rating = json['rating'];
    isNative = json['isNative'];
    price = json['price'];
    isOnline = json['isOnline'];
    // isFavoriteTutor = json['isfavoritetutor'] == "1";
    isFavoriteTutor = json['isFavoriteTutor']??false;
  }

  Tutor.fromJsonFromGetTutorById(Map<String, dynamic> json) {
    video = json['video'];
    bio = json['bio'];
    education = json['education'];
    experience = json['experience'];
    profession = json['profession'];
    accent = json['accent'];
    targetStudent = json['targetStudent'];
    interests = json['interests'];
    languages = json['languages'];
    specialties = json['specialties'];
    rating = json['rating'];
    isNative = json['isNative'];
    user = json['User'] != null
        ? User.fromJsonFromGetTutorById(json['User'])
        : null;
    isFavoriteTutor = json['isFavorite'] == true;
    rating = json['avgRating'] * 1.0;
  }

  String? accent;
  String? apple;
  String? avatar;
  String? bio;
  String? birthday;
  bool? canSendMessage;
  String? caredByStaffId;
  String? country;
  String? createdAt;
  String? deletedAt;
  String? education;
  String? email;
  String? experience;
  String? facebook;
  List<Feedbacks>? feedbacks;
  String? google;
  String? id;
  String? interests;
  bool? isActivated;
  bool? isFavoriteTutor;
  String? isNative;
  bool? isOnline;
  String? isPhoneActivated;
  bool? isPhoneAuthActivated;
  bool? isPublicRecord;
  String? language;
  String? languages;
  String? level;
  String? name;
  String? phone;
  String? phoneAuth;
  int? price;
  String? profession;
  double? rating;
  bool? requestPassword;
  String? requireNote;
  String? resume;
  String? specialties;
  String? studentGroupId;
  String? studySchedule;
  String? targetStudent;
  int? timezone;
  String? updatedAt;
  User? user;
  String? userId;
  String? video;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['level'] = level;
    data['email'] = email;
    data['google'] = google;
    data['facebook'] = facebook;
    data['apple'] = apple;
    data['avatar'] = avatar;
    data['name'] = name;
    data['country'] = country;
    data['phone'] = phone;
    data['language'] = language;
    data['birthday'] = birthday;
    data['requestPassword'] = requestPassword;
    data['isActivated'] = isActivated;
    data['isPhoneActivated'] = isPhoneActivated;
    data['requireNote'] = requireNote;
    data['timezone'] = timezone;
    data['phoneAuth'] = phoneAuth;
    data['isPhoneAuthActivated'] = isPhoneAuthActivated;
    data['studySchedule'] = studySchedule;
    data['canSendMessage'] = canSendMessage;
    data['isPublicRecord'] = isPublicRecord;
    data['caredByStaffId'] = caredByStaffId;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['deletedAt'] = deletedAt;
    data['studentGroupId'] = studentGroupId;
    if (feedbacks != null) {
      data['feedbacks'] = feedbacks!.map((v) => v.toJson()).toList();
    }
    data['id'] = id;
    data['userId'] = userId;
    data['video'] = video;
    data['bio'] = bio;
    data['education'] = education;
    data['experience'] = experience;
    data['profession'] = profession;
    data['accent'] = accent;
    data['targetStudent'] = targetStudent;
    data['interests'] = interests;
    data['languages'] = languages;
    data['specialties'] = specialties;
    data['resume'] = resume;
    data['rating'] = rating;
    data['isNative'] = isNative;
    data['price'] = price;
    data['isOnline'] = isOnline;
    return data;
  }
}

class Feedbacks {
  Feedbacks(
      {id,
      bookingId,
      firstId,
      secondId,
      rating,
      content,
      createdAt,
      updatedAt,
      firstInfo});

  Feedbacks.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bookingId = json['bookingId'];
    firstId = json['firstId'];
    secondId = json['secondId'];
    rating = json['rating'];
    content = json['content'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    firstInfo = json['firstInfo'] != null
        ? FirstInfo.fromJson(json['firstInfo'])
        : null;
  }

  String? bookingId;
  String? content;
  String? createdAt;
  String? firstId;
  FirstInfo? firstInfo;
  String? id;
  int? rating;
  String? secondId;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['bookingId'] = bookingId;
    data['firstId'] = firstId;
    data['secondId'] = secondId;
    data['rating'] = rating;
    data['content'] = content;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    if (firstInfo != null) {
      data['firstInfo'] = firstInfo!.toJson();
    }
    return data;
  }
}

class FirstInfo {
  FirstInfo({name, avatar});

  FirstInfo.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    avatar = json['avatar'];
  }

  String? avatar;
  String? name;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['avatar'] = avatar;
    return data;
  }
}
