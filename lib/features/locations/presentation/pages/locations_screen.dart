import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oborkom/core/helpers/extension.dart';
import 'package:oborkom/core/routes/routes.dart';
import 'package:oborkom/core/utils/constant.dart';
import 'package:oborkom/core/widgets/loader_widget.dart';
import 'package:oborkom/core/widgets/my_app_bar.dart';
import 'package:oborkom/generated/assets.dart';
import '../../../../generated/l10n.dart';
import '../cubit/locations_cubit.dart';
import '../widgets/location_screen_widgets/locations_listview_item.dart';

class LocationsScreen extends StatelessWidget {
  const LocationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: S.of(context).addresses,
        actions: [
          IconButton(
            onPressed: () {
              context.pushNamed(
                Routes.pickLocation,
                arguments: MapContext(type: MapTypes.addLocation),
              );
            },
            icon: SvgPicture.asset(
              Assets.imagesAddCircle,
              fit: BoxFit.fill,
              width: 24,
              height: 24,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<LocationsCubit, LocationsState>(
          builder: (context, state) {
            if(state.isLoading) {
              return const LoaderWidget();
            }
            final list = state.locations ?? [];
            if (list.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    15.height,
                    Text(
                      S.of(context).noAddresses,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ],
                ),
              );
            }
            return ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) =>  LocationListviewItem(
                model: state.locations![index],
              ),
            );
          },
        ),
      ),
    );
  }
}
