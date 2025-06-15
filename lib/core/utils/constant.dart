

import 'package:logger/logger.dart';
import 'package:oborkom/features/locations/presentation/cubit/locations_cubit.dart';

enum MapTypes
{
  orderPick,
  addLocation,
}

class MapContext
{
  final MapTypes type;
  final LocationsCubit ? cubit;

  MapContext({required this.type,this.cubit});
}

var logger = Logger();
