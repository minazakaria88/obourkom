import 'package:dio/dio.dart';
import 'package:oborkom/core/api/api_helper.dart';

import '../../../../core/api/end_point.dart';
import '../../../../core/api/failure.dart';

class OrderRepository{
  final ApiHelper apiHelper;
  OrderRepository({required this.apiHelper});


  Future makeOrder(data)async{
    try{
      final response = await apiHelper.postData(url: EndPoints.makeOrder, data: data);
      return response.data['status'];
    }catch(e){
      if(e is DioException){
        throw ApiException(failure: ServerFailure.serverError(e));
      }
      throw ApiException(failure: Failure(message: e.toString()));
    }
  }
}