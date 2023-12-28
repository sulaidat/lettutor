class Course {
  Course(
      {id,
      name,
      description,
      imageUrl,
      level,
      reason,
      purpose,
      otherDetails,
      defaultPrice,
      coursePrice,
      courseType,
      sectionType,
      visible,
      displayOrder,
      createdAt,
      updatedAt,
      topics,
      categories,
      levelString});

  Course.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    imageUrl = json['imageUrl'];
    level = json['level'];
    reason = json['reason'];
    purpose = json['purpose'];
    otherDetails = json['other_details'];
    defaultPrice = json['default_price'];
    coursePrice = json['course_price'];
    courseType = json['courseType'];
    sectionType = json['sectionType'];
    visible = json['visible'];
    displayOrder = json['displayOrder'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];

    levelString = int.parse(level!) < 3
        ? 'Beginner'
        : int.parse(level!) < 7
            ? 'Intermediate'
            : 'Advanced';

    if (json['topics'] != null) {
      topics = <Topics>[];
      json['topics'].forEach((v) {
        topics!.add(Topics.fromJson(v));
      });
    }
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(Categories.fromJson(v));
      });
    }
  }

  List<Categories>? categories;
  int? coursePrice;
  String? courseType;
  String? createdAt;
  int? defaultPrice;
  String? description;
  String? displayOrder;
  String? id;
  String? imageUrl;
  String? level;
  String? levelString;
  String? name;
  String? otherDetails;
  String? purpose;
  String? reason;
  String? sectionType;
  List<Topics>? topics;
  String? updatedAt;
  bool? visible;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['imageUrl'] = imageUrl;
    data['level'] = level;
    data['reason'] = reason;
    data['purpose'] = purpose;
    data['other_details'] = otherDetails;
    data['default_price'] = defaultPrice;
    data['course_price'] = coursePrice;
    data['courseType'] = courseType;
    data['sectionType'] = sectionType;
    data['visible'] = visible;
    data['displayOrder'] = displayOrder;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    if (topics != null) {
      data['topics'] = topics!.map((v) => v.toJson()).toList();
    }
    if (categories != null) {
      data['categories'] = categories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Topics {
  Topics(
      {id,
      courseId,
      orderCourse,
      name,
      nameFile,
      numberOfPages,
      description,
      videoUrl,
      type,
      createdAt,
      updatedAt});

  Topics.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    courseId = json['courseId'];
    orderCourse = json['orderCourse'];
    name = json['name'];
    nameFile = json['nameFile'];
    numberOfPages = json['numberOfPages'];
    description = json['description'];
    videoUrl = json['videoUrl'];
    type = json['type'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  String? courseId;
  String? createdAt;
  String? description;
  String? id;
  String? name;
  String? nameFile;
  String? numberOfPages;
  int? orderCourse;
  String? type;
  String? updatedAt;
  String? videoUrl;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['courseId'] = courseId;
    data['orderCourse'] = orderCourse;
    data['name'] = name;
    data['nameFile'] = nameFile;
    data['numberOfPages'] = numberOfPages;
    data['description'] = description;
    data['videoUrl'] = videoUrl;
    data['type'] = type;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}

class Categories {
  Categories(
      {id,
      title,
      description,
      key,
      displayOrder,
      createdAt,
      updatedAt});

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    key = json['key'];
    displayOrder = json['displayOrder'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  String? createdAt;
  String? description;
  String? displayOrder;
  String? id;
  String? key;
  String? title;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['key'] = key;
    data['displayOrder'] = displayOrder;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
