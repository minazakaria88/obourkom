class MessageModel {
  final String sender;
  final String message;
  final String time;

  MessageModel({
    required this.sender,
    required this.message,
    required this.time,
  });

  MessageModel.fromJson(Map<String, dynamic> json)
    : sender = json['sender'],
      message = json['message'],
      time = json['time'];
}
