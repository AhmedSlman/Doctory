import 'package:doctory/core/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_colors.dart';
import '../view_models/cubit/home_cubit.dart';

class BottomNavBarView extends StatelessWidget {
  const BottomNavBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = HomeCubit.get(context);

          return Scaffold(
            body: cubit.bottomNavScreens[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(

              currentIndex: cubit.currentIndex,
              backgroundColor: AppColors.bottomNavColor,
              selectedItemColor: AppColors.primaryColor,


              onTap: (index) {
                cubit.changeBottom(index);
              },
              items: const [
                BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage('assets/images/medicine.png'),
                  ),
                  label: AppStrings.pharmacies, // Provide a non-null label

                ),
                BottomNavigationBarItem(
                  icon: ImageIcon(
                      AssetImage('assets/images/calendar.png')
                  ),
                  label: AppStrings.booking, // Provide a non-null label

                ),
                BottomNavigationBarItem(
                  icon: ImageIcon(
                      AssetImage('assets/images/home.png')
                  ),
                  label: AppStrings.homePage, // Provide a non-null label


                ),




                // Add Settings if needed
              ],
            ),
          );
        },
      ),
    );;
  }
}
