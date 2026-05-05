import 'package:oborkom/core/network/api_helper.dart';
import 'package:oborkom/core/network/end_point.dart';
import 'package:oborkom/core/helpers/location_service.dart';
import 'package:oborkom/features/locations/data/models/auto_complete_location_model.dart';
import 'package:oborkom/features/locations/data/models/details_location_model.dart';
import '../../../../core/utils/constant.dart';
import '../models/location_model.dart';

class LocationRepository {
  final ApiHelper apiHelper;
  final LocationService locationService;

  LocationRepository({required this.apiHelper, required this.locationService});

  Future<List<LocationModel>> getLocations() async {
    final List<LocationModel> locations = [];
      final response = await apiHelper.getData(url: EndPoints.addresses);
      response.data.forEach((e) {
        locations.add(LocationModel.fromJson(e));
      });
      return locations;
  }

  Future<void> postAddresses(LocationModel model) async {
       await apiHelper.postData(
        url: EndPoints.addresses,
        data: model.toJson(),
      );
  }


  Future<void> putAddresses(LocationModel model, int id) async {
       await apiHelper.putData(
        url: '${EndPoints.addresses}/$id',
        data: model.toJson(),
      );
  }



  Future<void> deleteAddress(int id) async {
      await apiHelper.deleteData(url: '${EndPoints.addresses}/$id');
  }

  Future<void> updateAddresses(LocationModel model) async {
      await apiHelper.putData(url: EndPoints.addresses, data: model.toJson());
  }

  Future<List<AutoCompleteLocationModel>> getAuCompleteLocations(data) async {
    final List<AutoCompleteLocationModel> locations = [];
      final response = await locationService.getData(
        url: LocationService.placeAutocompleteUrl,
        queryParameters: data,
      );
      logger.d(response.data);
      for (var element in response.data['predictions']) {
        locations.add(AutoCompleteLocationModel.fromJson(element));
      }
      return locations;
  }

  Future<DetailsLocationModel> getDetailsLocation(data) async {
      final response = await locationService.getData(
        url: LocationService.placeDetailsUrl,
        queryParameters: data,
      );
      return DetailsLocationModel.fromJson(response.data);
  }
}
