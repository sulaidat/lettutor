

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
  List<String>? coursesId;
  String? requireNote;
  String? level;
  List<LearnTopic>? learnTopics;
  List<TestPreparation>? testPreparations;
  bool? isPhoneActivated;
  int? timezone;
  String? studySchedule;
  bool? canSendMessage;

  User({
    this.id,
    this.email,
    this.name,
    this.avatar,
    this.country,
    this.phone,
    this.roles,
    this.language,
    this.birthday,
    this.isActivated,
    this.walletInfo,
    this.coursesId,
    this.requireNote,
    this.level,
    this.learnTopics,
    this.testPreparations,
    this.isPhoneActivated,
    this.timezone,
    this.studySchedule,
    this.canSendMessage,
  });

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
    walletInfo =
        json['walletInfo'] != null ? WalletInfo.fromJson(json['walletInfo']) : null;
    if (json['courses'] != null) {
      coursesId = [];
      json['courses'].forEach((course) {
        coursesId!.add(course['id']);
      });
    }
    requireNote = json['requireNote'];
    level = json['level'];
    if (json['learnTopics'] != null) {
      learnTopics = [];
      json['learnTopics'].forEach((topic) {
        learnTopics!.add(LearnTopic.fromJson(topic));
      });
    }
    if (json['testPreparations'] != null) {
      testPreparations = [];
      json['testPreparations'].forEach((test) {
        testPreparations!.add(TestPreparation.fromJson(test));
      });
    }
    isPhoneActivated = json['isPhoneActivated'];
    timezone = json['timezone'];
    studySchedule = json['studySchedule'];
    canSendMessage = json['canSendMessage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
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
    if (coursesId != null) {
      data['courses'] = coursesId;
    }
    data['requireNote'] = requireNote;
    data['level'] = level;
    if (learnTopics != null) {
      data['learnTopics'] = learnTopics!.map((v) => v.toJson()).toList();
    }
    if (testPreparations != null) {
      data['testPreparations'] = testPreparations!.map((v) => v.toJson()).toList();
    }
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

  WalletInfo({
    this.id,
    this.userId,
    this.amount,
    this.isBlocked,
    this.createdAt,
    this.updatedAt,
    this.bonus,
  });

  WalletInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    amount = json['amount'];
    isBlocked = json['isBlocked'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    bonus = json['bonus'];
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'userId': userId,
        'amount': amount,
        'isBlocked': isBlocked,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
        'bonus': bonus,
      };

// final String id;
// final String userId;
// final String amount;
// final bool isBlocked;
// final String createdAt;
// final String updatedAt;
// final int bonus;
//
// WalletInfo(
//     {required this.id,
//     required this.userId,
//     required this.amount,
//     required this.isBlocked,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.bonus});
//
// static WalletInfo fromJson(Map<String, dynamic> json) => WalletInfo(
//     id: json['id'] as String,
//     userId: json['userId'] as String,
//     amount: json['amount'] as String,
//     isBlocked: json['isBlocked'] as bool,
//     createdAt: json['createdAt'] as String,
//     updatedAt: json['updatedAt'] as String,
//     bonus: json['bonus'] as int);
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