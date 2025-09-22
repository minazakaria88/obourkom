class AutoCompleteLocationModel {
  final String placeId;
  final String description;

  AutoCompleteLocationModel({required this.placeId, required this.description});

  factory AutoCompleteLocationModel.fromJson(Map<String, dynamic> json) {
    return AutoCompleteLocationModel(
      placeId: json['place_id'],
      description: json['description'],
    );
  }
}
