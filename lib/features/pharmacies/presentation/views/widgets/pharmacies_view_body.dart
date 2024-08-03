
import 'package:doctory/features/booking/presentation/views/widgets/location_button.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/widgets/custom_app_bar.dart';
import '../../../../../core/widgets/custom_grid_view.dart';
import '../../../data/data_source/pharmacies_grid_data_source.dart';

class PharmaciesViewBody extends StatelessWidget {
  const PharmaciesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.025),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const CustomAppBar(title:AppStrings.pharmacies),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          const LocationButton(),
          const SizedBox(
            height: 25,
          ),
          Expanded(child: CustomGridView(items:pharmaciesGridViewItems, buttonText:AppStrings.call,)),
        ],
      ),
    );
  }
}
