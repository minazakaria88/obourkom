class FaqModel
{
  String? question;
  String? answer;
  FaqModel({this.question, this.answer});



  FaqModel.fromJson(Map<String, dynamic> json) {
    question = json['question'];
    answer = json['answer'];
  }
}