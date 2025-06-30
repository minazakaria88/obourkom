import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:oborkom/core/api/failure.dart';
import 'package:oborkom/features/register/data/repositories/register_repo.dart';
part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit({required this.registerRepository}) : super(RegisterState());
  final RegisterRepository registerRepository;
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void register() async {
    emit(state.copyWith(registerStatus: RegisterStatus.loading));
    final data = {
      'name': nameController.text,
      'email': emailController.text,
      'phone': '+966${phoneController.text}',
    };
    try {
      await registerRepository.register(data);
      emit(state.copyWith(registerStatus: RegisterStatus.success));
    } on ApiException catch (e) {
      emit(
        state.copyWith(
          registerStatus: RegisterStatus.failure,
          errorMessage: e.failure.message,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          registerStatus: RegisterStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }



  dispose() {
    emailController.dispose();
    nameController.dispose();
    phoneController.dispose();
  }


  @override
  Future<void> close() {
    dispose();
    return super.close();
  }
}
