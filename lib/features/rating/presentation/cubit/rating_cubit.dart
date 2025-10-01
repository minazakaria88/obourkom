import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:oborkom/features/rating/data/repositories/rating_repo.dart';

import '../../../../core/api/failure.dart';

part 'rating_state.dart';

class RatingCubit extends Cubit<RatingState> {
  RatingCubit({required this.ratingRepository}) : super(const RatingState());

  final RatingRepository ratingRepository;
   final TextEditingController controller=TextEditingController();
  final formKey = GlobalKey<FormState>();

  void rateDriver({required String orderId,required String rate}) async {
    try {
      final data={
        'score':rate,
        'comment':controller.text,
      };
      emit(state.copyWith(rateDriverStatus: RateDriverStatus.loading));
      await ratingRepository.rateDriver(orderId: orderId,data: data);
      emit(state.copyWith(rateDriverStatus: RateDriverStatus.success));
    } on ApiException catch (e) {
      emit(
        state.copyWith(
          rateDriverStatus: RateDriverStatus.failure,
          errorMessage: e.failure.message,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          rateDriverStatus: RateDriverStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  void updateUi()
  {
    emit(state.copyWith(rateDriverStatus: RateDriverStatus.initial));
  }

}
