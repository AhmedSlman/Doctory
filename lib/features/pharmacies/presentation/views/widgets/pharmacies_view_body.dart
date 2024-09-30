import 'package:doctory/core/widgets/custom_circular_progress_indicator.dart';
import 'package:doctory/features/booking/presentation/views/widgets/location_button.dart';
import 'package:doctory/features/pharmacies/presentation/view_models/pharmacies_cubit.dart';
import 'package:doctory/features/pharmacies/presentation/view_models/pharmacies_state.dart';
import 'package:doctory/features/pharmacies/presentation/views/widgets/pharmacies_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/widgets/custom_app_bar.dart';
import '../../../../../generated/l10n.dart';

class PharmaciesViewBody extends StatelessWidget {
  const PharmaciesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<PharmaciesCubit>(context);
    cubit.getPharmacies(); // Load both categories and offers

    return BlocBuilder<PharmaciesCubit, PharmaciesState>(
      builder: (context, state) {
        if (state is PharmaciesLoading) {
          return const CustomCircularProgressIndicator();
        } else if (state is PharmaciesSuccess) {
          return Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.025),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const CustomAppBar(title: AppStrings.pharmacies),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                const LocationButton(),
                const SizedBox(
                  height: 25,
                ),
                Expanded(
                  child: CustomPharmaciesGridView(
                    items: state.pharmacies.toList(),
                    buttonText: S.of(context).call,
                  ),
                ),
              ],
            ),
          );
        } else if (state is PharmaciesError) {
          return Center(child: Text(state.message));
        }
        return const SizedBox.shrink();
      },
    );
  }
}