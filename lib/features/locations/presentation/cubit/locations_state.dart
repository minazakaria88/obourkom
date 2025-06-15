part of 'locations_cubit.dart';

enum LocationsStatus { loading, success, error }

class LocationsState extends Equatable {
  LatLng? pickedLocation;
  Placemark? locationData;
  List<LocationModel>? locations;
  LocationsStatus? locationsStatus;
  String? errorMessage;

  LocationsState({
    this.pickedLocation,
    this.locationData,
    this.locations,
    this.locationsStatus,
    this.errorMessage,
  });

  LocationsState copyWith({
    LatLng? pickedLocation,
    Placemark? locationData,
    List<LocationModel>? locations,
    LocationsStatus? locationsStatus,
    String? errorMessage,

  }) {
    return LocationsState(
      pickedLocation: pickedLocation ?? this.pickedLocation,
      locationData: locationData ?? this.locationData,
      locations: locations ?? this.locations,
      errorMessage: errorMessage?? this.errorMessage,
      locationsStatus: locationsStatus?? this.locationsStatus
    );
  }

  @override
  List<Object?> get props => [pickedLocation, locations, locationData,errorMessage,locationsStatus];
}
