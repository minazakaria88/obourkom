import 'package:dio/dio.dart';

class MessageModel {
  String? message;
  String? senderId;
  String? receiverId;
  DateTime? dateTime;
  String? voicePath;
  String ? type;

  MessageModel({this.message, this.senderId, this.receiverId, this.dateTime,this.type});

  MessageModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    senderId = json['senderId'];
    receiverId = json['receiverId'];
    dateTime = DateTime.parse(json['created_at']);
    type=json['type'];
  }

  dynamic toJson() async {
    // final Map<String, dynamic> data = <String, dynamic>{};

    final data = FormData.fromMap({
      'senderId': senderId,
      'receiverId': receiverId,
      'type':type,
      'created_at': dateTime.toString(),
      if (message != null) 'message': message,
      if (voicePath != null)
        'voice-path': await MultipartFile.fromFile(voicePath ?? ''),
    });
    // data['message'] = message;
    // data['senderId'] = senderId;
    // data['receiverId'] = receiverId;
    // data['created_at'] = dateTime.toString();
    return data;
  }
}
