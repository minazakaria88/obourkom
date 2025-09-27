part of 'locations_cubit.dart';

enum LocationsStatus { loading, success, error }

enum PostLocationState { loading, success, error }

enum DeleteLocationState { loading, success, error }

extension LocationsStatusX on LocationsState {
  bool get isLoading => locationsStatus == LocationsStatus.loading;
  bool get isSuccess => locationsStatus == LocationsStatus.success;
  bool get isError => locationsStatus == LocationsStatus.error;
  bool get isPostLocationsSuccess =>
      postLocationState == PostLocationState.success;
  bool get isPostLocationsError => postLocationState == PostLocationState.error;
  bool get isPostLocationsLoading =>
      postLocationState == PostLocationState.loading;
  bool get isDeleteLocationSuccess =>
      deleteLocationState == DeleteLocationState.success;
  bool get isDeleteLocationError =>
      deleteLocationState == DeleteLocationState.error;
  bool get isDeleteLocationLoading =>
      deleteLocationState == DeleteLocationState.loading;
}

class LocationsState extends Equatable {
 final LatLng? pickedLocation;
 final Placemark? locationData;
 final List<LocationModel>? locations;
 final LocationsStatus? locationsStatus;
 final PostLocationState? postLocationState;
 final String? errorMessage;
 final int? locationType;
 final DeleteLocationState? deleteLocationState;
 final List<AutoCompleteLocationModel>? autoCompleteLocations;
 final bool ? isShowPickerWidget;

  const LocationsState({
    this.pickedLocation,
    this.locationData,
    this.locations,
    this.locationsStatus,
    this.errorMessage,
    this.locationType,
    this.postLocationState,
    this.deleteLocationState,
    this.autoCompleteLocations,
    this.isShowPickerWidget=true,
  });

  LocationsState copyWith({
    LatLng? pickedLocation,
    Placemark? locationData,
    List<LocationModel>? locations,
    LocationsStatus? locationsStatus,
    String? errorMessage,
    int? locationType,
    PostLocationState? postLocationState,
    DeleteLocationState? deleteLocationState,
    List<AutoCompleteLocationModel>? autoCompleteLocations,
    bool? isShowPickerWidget,
  }) {
    return LocationsState(
      pickedLocation: pickedLocation ?? this.pickedLocation,
      locationData: locationData ?? this.locationData,
      locations: locations ?? this.locations,
      errorMessage: errorMessage ?? this.errorMessage,
      locationsStatus: locationsStatus ?? this.locationsStatus,
      locationType: locationType ?? this.locationType,
      postLocationState: postLocationState ?? this.postLocationState,
      deleteLocationState: deleteLocationState ?? this.deleteLocationState,
      autoCompleteLocations:
          autoCompleteLocations ?? this.autoCompleteLocations,
      isShowPickerWidget: isShowPickerWidget ?? this.isShowPickerWidget,
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
    postLocationState,
    deleteLocationState,
    autoCompleteLocations,
    isShowPickerWidget,
  ];
}
