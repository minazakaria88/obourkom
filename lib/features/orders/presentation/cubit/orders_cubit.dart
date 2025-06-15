import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../core/functions/get_places_mark.dart';


part 'orders_state.dart';

class OrdersCubit extends Cubit<OrdersState> {
  OrdersCubit() : super(OrdersState());

  final formKey=GlobalKey<FormState>();
  final TextEditingController notesController=TextEditingController();
  final TextEditingController codeController=TextEditingController();

  void pickDeliveryLocation(LatLng position) async {
    final locationData = await getAddressFromLatAndLng(position);
    emit(
      state.copyWith(
        deliveryLocation: LatLng(position.latitude, position.longitude),
        deliveryLocationData: locationData.first,
      ),
    );
  }


  void pickPickupLocation(LatLng position) async {
    final locationData = await getAddressFromLatAndLng(position);
    emit(
      state.copyWith(
        pickedLocation: LatLng(position.latitude, position.longitude),
        pickedLocationData: locationData.first,
      ),
    );
  }






}
