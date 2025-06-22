import 'package:dio/dio.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:oborkom/core/api/api_helper.dart';
import 'package:oborkom/core/api/end_point.dart';
import 'package:oborkom/core/api/failure.dart';

import '../models/location_model.dart';

class LocationRepository {
  final ApiHelper apiHelper;

  LocationRepository({required this.apiHelper});

  Future<List<LocationModel>> getLocations() async {
    final List<LocationModel> locations = [];
    try {
      // final response = await apiHelper.getData(url: EndPoints.login);
      // response.data.forEach((e) {
      //   locations.add(LocationModel.fromJson(e));
      // });
      locations.add(
        LocationModel(
          id: 1,
          name:
              'PM8G+HVJ حي الورد، الأمير فيصل بن سعد بن عبدالرحمن، الورود، الرياض 12251، المملكة العربية السعودية',

          latLng: const LatLng(30.0444, 31.2357),
          type: 'home',
        ),
      );
      locations.add(
        LocationModel(
          id: 2,
          name:
              'PM8G+HVJ حي الورد، الأمير فيصل بن سعد بن عبدالرحمن، الورود، الرياض 12251، المملكة العربية السعودية',

          latLng: const LatLng(30.0444, 31.2357),
          type: 'work',
        ),
      );
      locations.add(
        LocationModel(
          id: 3,
          name:
              'PM8G+HVJ حي الورد، الأمير فيصل بن سعد بن عبدالرحمن، الورود، الرياض 12251، المملكة العربية السعودية',

          latLng: const LatLng(30.0444, 31.2357),
          type: 'other',
        ),
      );
      await Future.delayed(const Duration(seconds: 2));
      return locations;
    } catch (e) {
      if (e is DioException) {
        throw ApiException(failure: ServerFailure.serverError(e));
      }
      throw ApiException(failure: Failure(message: e.toString()));
    }
  }
}
