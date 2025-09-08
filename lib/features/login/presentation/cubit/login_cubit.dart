import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:oborkom/core/api/failure.dart';
import 'package:oborkom/features/login/data/repositories/login_repo.dart';

import '../../../../core/utils/constant.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.loginRepository}) : super(LoginState());
  final LoginRepository loginRepository;

 final TextEditingController phoneController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void login() async {
    emit(state.copyWith(loginStatus: LoginStatus.loading));
    try {
      logger.d('+966${phoneController.text}');
      await loginRepository.login(phoneNumber: '+966${phoneController.text}');
      emit(state.copyWith(loginStatus: LoginStatus.success));
    } on ApiException catch (e) {
      emit(
        state.copyWith(
          loginStatus: LoginStatus.failure,
          errorMessage: e.failure.message,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          loginStatus: LoginStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }


  dispose() {
    phoneController.dispose();
  }


  @override
  Future<void> close() {
    dispose();
    return super.close();
  }
}
