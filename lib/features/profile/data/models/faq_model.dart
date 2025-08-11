class FaqModel {
  List<Questions>? questions;

  FaqModel({this.questions});

  FaqModel.fromJson(Map<String, dynamic> json) {
    if (json['questions'] != null) {
      questions = <Questions>[];
      json['questions'].forEach((v) {
        questions!.add(Questions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (questions != null) {
      data['questions'] = questions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Questions {
  int? id;
  int? userId;
  String? createdAt;
  String? updatedAt;
  String? title;
  String? content;
  List<Translations>? translations;

  Questions(
      {this.id,
        this.userId,
        this.createdAt,
        this.updatedAt,
        this.title,
        this.content,
        this.translations});

  Questions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    title = json['title'];
    content = json['content'];
    if (json['translations'] != null) {
      translations = <Translations>[];
      json['translations'].forEach((v) {
        translations!.add(Translations.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['title'] = title;
    data['content'] = content;
    if (translations != null) {
      data['translations'] = translations!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Translations {
  int? id;
  int? questionId;
  String? title;
  String? content;
  String? locale;

  Translations(
      {this.id, this.questionId, this.title, this.content, this.locale});

  Translations.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    questionId = json['question_id'];
    title = json['title'];
    content = json['content'];
    locale = json['locale'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['question_id'] = questionId;
    data['title'] = title;
    data['content'] = content;
    data['locale'] = locale;
    return data;
  }
}