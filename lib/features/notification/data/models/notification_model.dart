class NotificationModel {
  String? title;
  String? description;
  int? id;
  bool? isRead;
  String? dateTime;

  NotificationModel(
    this.title,
    this.description,
    this.id,
    this.isRead,
    this.dateTime,
  );


  NotificationModel.fromJson(Map<String,dynamic> json)
  {
    title = json['title'];
    description = json['description'];
    id = json['id'];
    isRead = json['isRead'];
    dateTime = json['dateTime'];
  }
}
