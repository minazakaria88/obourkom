part of 'register_cubit.dart';

enum RegisterStatus { loading, success, failure }

extension RegisterStatusX on RegisterState {
  bool get isLoading => registerStatus == RegisterStatus.loading;
  bool get isSuccess => registerStatus == RegisterStatus.success;
  bool get isFailure => registerStatus == RegisterStatus.failure;
}

class RegisterState extends Equatable {
  final RegisterStatus? registerStatus;
  final String? errorMessage;
  const RegisterState({this.registerStatus, this.errorMessage});

  RegisterState copyWith({
    RegisterStatus? registerStatus,
    String? errorMessage,
  }) {
    return RegisterState(
      errorMessage: errorMessage ?? this.errorMessage,
      registerStatus: registerStatus ?? this.registerStatus,
    );
  }

  @override
  List<Object?> get props => [registerStatus, errorMessage];
}
