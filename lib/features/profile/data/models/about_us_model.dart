class AboutUsModel
{

  String ? title;
  String ? content;

  AboutUsModel.fromJson(Map<String,dynamic> json)
  {
     title=json['title'];
     content=json['content'];
  }
}