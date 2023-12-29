import 'package:lettutor/src/models/tutor/tutor_info.dart';

class User {
  String? id;
  String? email;
  String? name;
  String? avatar;
  String? country;
  String? phone;
  List<String>? roles;
  String? language;
  String? birthday;
  bool? isActivated;
  WalletInfo? walletInfo;
  List<UserCourse>? courses;
  String? requireNote;
  String? level;
  List<Topic>? learnTopics;
  List<Topic>? testPreparations;
  bool? isPhoneActivated;
  int? timezone;
  String? studySchedule;
  bool? canSendMessage;
  bool? isPublicRecord;
  String? caredByStaffId;
  String? studentGroupId;
  TutorInfo? tutorInfo;

  User(
      {id,
      email,
      name,
      avatar,
      country,
      phone,
      roles,
      language,
      birthday,
      isActivated,
      walletInfo,
      courses,
      requireNote,
      level,
      learnTopics,
      testPreparations,
      isPhoneActivated,
      timezone,
      studySchedule,
      canSendMessage});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    name = json['name'];
    avatar = json['avatar'];
    country = json['country'];
    phone = json['phone'];
    roles = json['roles']?.cast<String>();
    language = json['language'];
    birthday = json['birthday'];
    isActivated = json['isActivated'];
    walletInfo = json['walletInfo'] != null
        ? WalletInfo.fromJson(json['walletInfo'])
        : null;
    if (json['courses'] != null) {
      courses = <UserCourse>[];
      json['courses'].forEach((v) {
        courses!.add(UserCourse.fromJson(v));
      });
    }
    requireNote = json['requireNote'];
    level = json['level'];
    if (json['learnTopics'] != null) {
      learnTopics = <Topic>[];
      json['learnTopics'].forEach((v) {
        learnTopics!.add(Topic.fromJson(v));
      });
    }
    if (json['testPreparations'] != null) {
      testPreparations = <Topic>[];
      json['testPreparations'].forEach((v) {
        testPreparations!.add(Topic.fromJson(v));
      });
    }

    isPhoneActivated = json['isPhoneActivated'];
    timezone = json['timezone'];
    studySchedule = json['studySchedule'];
    canSendMessage = json['canSendMessage'];
    tutorInfo = json['tutorInfo'] != null
        ? TutorInfo.fromJson(json['tutorInfo'])
        : null;
  }

  User.fromJsonFromRegister(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    name = json['name'];
    avatar = json['avatar'];
    country = json['country'];
    phone = json['phone'];
    language = json['language'];
    birthday = json['birthday'];
    isActivated = json['isActivated'];
    requireNote = json['requireNote'];
    level = json['level'];
    isPhoneActivated = json['isPhoneActivated'];
    timezone = json['timezone'];
    studySchedule = json['studySchedule'];
    canSendMessage = json['canSendMessage'];
  }
  User.fromJsonFromGetTutorById(Map<String, dynamic> json) {
    id = json['id'];
    level = json['level'];
    avatar = json['avatar'];
    name = json['name'];
    country = json['country'];
    language = json['language'];
    isPublicRecord = json['isPublicRecord'];
    caredByStaffId = json['caredByStaffId'];
    studentGroupId = json['studentGroupId'];
    if (json['courses'] != null) {
      courses = [];
      json['courses'].forEach((v) {
        courses!.add(UserCourse.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['email'] = email;
    data['name'] = name;
    data['avatar'] = avatar;
    data['country'] = country;
    data['phone'] = phone;
    data['roles'] = roles;
    data['language'] = language;
    data['birthday'] = birthday;
    data['isActivated'] = isActivated;
    if (walletInfo != null) {
      data['walletInfo'] = walletInfo!.toJson();
    }
    data['courses'] = courses;
    data['requireNote'] = requireNote;
    data['level'] = level;
    data['learnTopics'] = learnTopics;
    data['testPreparations'] = testPreparations;
    data['isPhoneActivated'] = isPhoneActivated;
    data['timezone'] = timezone;
    data['studySchedule'] = studySchedule;
    data['canSendMessage'] = canSendMessage;
    return data;
  }
}

class WalletInfo {
  String? id;
  String? userId;
  String? amount;
  bool? isBlocked;
  String? createdAt;
  String? updatedAt;
  int? bonus;

  WalletInfo({id, userId, amount, isBlocked, createdAt, updatedAt, bonus});

  WalletInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    amount = json['amount'];
    isBlocked = json['isBlocked'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    bonus = json['bonus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['userId'] = userId;
    data['amount'] = amount;
    data['isBlocked'] = isBlocked;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['bonus'] = bonus;
    return data;
  }
}

class Topic {
  int? id;
  String? key;
  String? name;

  Topic({id, key, name});

  Topic.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    key = json['key'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['key'] = key;
    data['name'] = name;
    return data;
  }
}

class UserCourse {
  String? id;
  String? name;
  TutorCourse? tutorCourse;

  UserCourse({id, name, tutorCourse});

  UserCourse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    tutorCourse = json['TutorCourse'] != null
        ? TutorCourse.fromJson(json['TutorCourse'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    if (tutorCourse != null) {
      data['TutorCourse'] = tutorCourse!.toJson();
    }
    return data;
  }
}

class TutorCourse {
  String? userId;
  String? courseId;
  String? createdAt;
  String? updatedAt;

  TutorCourse({userId, courseId, createdAt, updatedAt});

  TutorCourse.fromJson(Map<String, dynamic> json) {
    userId = json['UserId'];
    courseId = json['CourseId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['UserId'] = userId;
    data['CourseId'] = courseId;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}

class TestPreparation {
  int? id;
  String? key;
  String? name;

  TestPreparation({this.id, this.key, this.name});

  TestPreparation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    key = json['key'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'key': key,
    'name': name,
  };
}

class LearnTopic {
  int? id;
  String? key;
  String? name;

  LearnTopic({this.id, this.key, this.name});

  LearnTopic.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    key = json['key'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'key': key,
        'name': name,
      };
}