


/// get locations model
class LocationModel
{
  int? id;
  String? name;
  String ?lat;
  String?lng;
  String? type;
  String? typeLabel;


  LocationModel({
    this.id,
    this.name,
    this.lat,
    this.lng,
    this.type,
    this.typeLabel
  });

    LocationModel.fromJson(Map<String,dynamic> json)
    {
      id = json['id'];
      name = json['name'];
      lat=json['location_latitude'];
      lng=json['location_longitude'];
      typeLabel=json['type_label'];
      type = json['type'];
    }


    Map<String,dynamic> toJson()
    {
      final data=<String,dynamic>{};
      data['location_longitude']=lng;
      data['location_latitude']=lat;
      data['name']=name;
      data['type']=type;
      return data;
    }

}