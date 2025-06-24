part of 'main_cubit.dart';

enum GetLocationState { loading, success, failure }

extension MainStateX on MainState {}

class MainState extends Equatable {
  GetLocationState? getLocationState;
  String? location;
  List<ServicesModel>? servicesList;
  String? errorMessage;
  List<String>? sliderList;

  MainState({
    this.getLocationState,
    this.location,
    this.servicesList,
    this.errorMessage,
    this.sliderList
  });

  MainState copyWith({
    GetLocationState? getLocationState,
    String? location,
    List<ServicesModel>? servicesList,
    String? errorMessage,
    List<String>? sliderList
  }) {
    return MainState(
      getLocationState: getLocationState ?? this.getLocationState,
      location: location ?? this.location,
      servicesList: servicesList ?? this.servicesList,
      errorMessage: errorMessage ?? this.errorMessage,
      sliderList: sliderList ?? this.sliderList
    );
  }

  @override
  List<Object?> get props => [
    getLocationState,
    location,
    servicesList,
    errorMessage,
    sliderList
  ];
}
