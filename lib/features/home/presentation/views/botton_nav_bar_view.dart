import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../generated/l10n.dart';
import '../view_models/bottom_nav_bar_cubit/bottom_nav_bar_cubit.dart';

class BottomNavBarView extends StatelessWidget {
  const BottomNavBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottomNavBarCubit(),
      child: BlocConsumer<BottomNavBarCubit, BottomNavBarStates>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = BottomNavBarCubit.get(context);

          return Scaffold(
            body: cubit.bottomNavScreens[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              selectedItemColor: AppColors.primaryColor,
              unselectedItemColor: AppColors.greyForIcon,
              backgroundColor: AppColors.greyColor,
              type: BottomNavigationBarType.fixed, // Fixed

              onTap: (index) {
                cubit.changeBottom(index);
              },
              items:  [
                BottomNavigationBarItem(
                  icon: const ImageIcon(
                    AssetImage('assets/images/home.png'),
                  ),
                  label: S.of(context).homePage,
                ),
                BottomNavigationBarItem(
                  icon: const ImageIcon(
                    AssetImage('assets/images/medicine.png'),
                  ),
                  label: S.of(context).pharmacies,
                ),
                BottomNavigationBarItem(
                    icon: const ImageIcon(
                      AssetImage('assets/images/calendar.png'),
                    ),
                    label: S.of(context).booking
                ),
                BottomNavigationBarItem(
                  icon: const ImageIcon(
                    AssetImage('assets/images/settings.png'),
                  ),
                  label: S.of(context).settings,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
