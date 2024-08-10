import 'package:doctory/core/utils/app_styles.dart';
import 'package:doctory/features/home/data/data_source/grid_view_data_source.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/app_strings.dart';
import 'categories_list_view.dart';
import 'custom_home_appbar.dart';
import '../../../../../core/widgets/custom_grid_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.025),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomHomeAppBar(),
           const Text(
            AppStrings.categories,
            style: AppStyles.sBlack15,
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.01),
          const CategoriesListView(),
          SizedBox(height: MediaQuery.of(context).size.height * 0.01),
           const Text(
            AppStrings.offers,
            style: AppStyles.sBlack15,
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
           Expanded(child: CustomGridView(items: gridViewItems, buttonText: AppStrings.bookNow,)),
        ],
      ),
    );
  }
}
