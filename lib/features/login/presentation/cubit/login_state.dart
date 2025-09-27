part of 'login_cubit.dart';

enum LoginStatus { loading, success, failure }

extension LoginStatusX on LoginState {
  bool get isLoading => loginStatus == LoginStatus.loading;
  bool get isSuccess => loginStatus == LoginStatus.success;
  bool get isFailure => loginStatus == LoginStatus.failure;
}

class LoginState extends Equatable {
  final LoginStatus? loginStatus;
  final String? errorMessage;

  const LoginState({this.loginStatus, this.errorMessage});

  LoginState copyWith({LoginStatus? loginStatus, String? errorMessage}) {
    return LoginState(
      errorMessage: errorMessage ?? this.errorMessage,
      loginStatus: loginStatus ?? this.loginStatus,
    );
  }

  @override
  List<Object?> get props => [loginStatus, errorMessage];
}
