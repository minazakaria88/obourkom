part of 'locations_cubit.dart';

enum LocationsStatus { loading, success, error }

extension LocationsStatusX on LocationsState {
  bool get isLoading => locationsStatus == LocationsStatus.loading;
  bool get isSuccess => locationsStatus == LocationsStatus.success;
  bool get isError => locationsStatus == LocationsStatus.error;
}


class LocationsState extends Equatable {
  LatLng? pickedLocation;
  Placemark? locationData;
  List<LocationModel>? locations;
  LocationsStatus? locationsStatus;
  String? errorMessage;
  int? locationType;

  LocationsState({
    this.pickedLocation,
    this.locationData,
    this.locations,
    this.locationsStatus,
    this.errorMessage,
    this.locationType,
  });

  LocationsState copyWith({
    LatLng? pickedLocation,
    Placemark? locationData,
    List<LocationModel>? locations,
    LocationsStatus? locationsStatus,
    String? errorMessage,
    int? locationType,
  }) {
    return LocationsState(
      pickedLocation: pickedLocation ?? this.pickedLocation,
      locationData: locationData ?? this.locationData,
      locations: locations ?? this.locations,
      errorMessage: errorMessage ?? this.errorMessage,
      locationsStatus: locationsStatus ?? this.locationsStatus,
      locationType: locationType ?? this.locationType,
    );
  }

  @override
  List<Object?> get props => [
    pickedLocation,
    locations,
    locationData,
    errorMessage,
    locationsStatus,
    locationType,
  ];
}
