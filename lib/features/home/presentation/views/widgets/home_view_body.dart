import 'package:doctory/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_strings.dart';
import 'categories_list_view.dart';
import 'custom_home_appbar.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomHomeAppBar(),
          Text(
            AppStrings.categories,
            style: AppStyles.sBlack15,
          ),
          SizedBox(
            height: 10,
          ),
          CategoriesListView(),
        ],
      ),
    );
  }
}
