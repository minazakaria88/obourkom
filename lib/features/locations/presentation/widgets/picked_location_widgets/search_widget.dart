import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/helpers/validation_inputs_class.dart';
import '../../../../../core/widgets/my_text_form_field.dart';
import '../../../../../generated/l10n.dart';
import '../../cubit/locations_cubit.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LocationsCubit, LocationsState>(
      listener: (context, state) {},
      builder: (context, state) {
        final cubit = context.read<LocationsCubit>();
        final autoCompleteList = state.autoCompleteLocations ?? [];
        return Positioned(
          top: 10,
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width - 20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.white,
                ),
                child: MyTextFormField(
                  prefixIcon: const Icon(Icons.search),
                  controller: cubit.searchController,
                  hint: S.of(context).searchOnMap,
                  onChange: (value) {
                    cubit.getAutoCompleteLocation();
                  },
                  validator: (String? value) {
                    return ValidationClass.validateText(
                      value,
                      S.of(context).location,
                    );
                  },
                ),
              ),
              autoCompleteList.isNotEmpty
                  ? Container(
                      width: MediaQuery.of(context).size.width - 20,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.white,
                      ),
                      child: ListView.separated(
                        shrinkWrap: true,
                        padding: const EdgeInsets.all(8),
                        itemCount: autoCompleteList.length,
                        separatorBuilder: (context, index) => const Divider(),
                        itemBuilder: (context, index) => ListTile(
                          leading: const Icon(
                            Icons.location_on,
                            color: Colors.red,
                          ),
                          title: Text(
                            autoCompleteList[index].description ?? '',
                          ),
                          onTap: () {
                            cubit.getDetailsLocation(
                              autoCompleteList[index].placeId,
                            );
                          },
                        ),
                      ),
                    )
                  : const SizedBox(),
            ],
          ),
        );
      },
    );
  }
}
