part of 'main_cubit.dart';

enum GetLocationState { loading, success, failure }


extension MainStateX on MainState {

}

class MainState extends Equatable {
  GetLocationState? getLocationState;
  String? location;
  List<ServicesModel>? servicesList;
  String ? errorMessage;

  MainState({this.getLocationState, this.location, this.servicesList,this.errorMessage});

  MainState copyWith({
    GetLocationState? getLocationState,
    String? location,
    List<ServicesModel>? servicesList,
    String? errorMessage
  }) {
    return MainState(
      getLocationState: getLocationState ?? this.getLocationState,
      location: location ?? this.location,
      servicesList: servicesList ?? this.servicesList,
      errorMessage: errorMessage ?? this.errorMessage
    );
  }

  @override
  List<Object?> get props => [getLocationState, location, servicesList, errorMessage];
}
