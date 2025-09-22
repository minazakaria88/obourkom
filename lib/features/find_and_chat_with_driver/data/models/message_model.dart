class MessageModel {
  String? message;
  String? senderId;
  String? receiverId;
  DateTime? dateTime;

  MessageModel({this.message, this.senderId, this.receiverId, this.dateTime});

  MessageModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    senderId = json['senderId'];
    receiverId = json['receiverId'];
    dateTime = DateTime.parse(json['created_at']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['senderId'] = senderId;
    data['receiverId'] = receiverId;
    data['created_at'] = dateTime.toString();
    return data;
  }
}
