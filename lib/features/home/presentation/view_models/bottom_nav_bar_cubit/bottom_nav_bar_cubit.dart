import 'package:doctory/features/booking/presentation/views/booking_view.dart';
import 'package:doctory/features/home/presentation/views/home_view.dart';
import 'package:doctory/features/pharmacies/presentation/views/pharmacies_view.dart';
import 'package:doctory/features/settings/presentation/views/settings_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'bottom_nav_bar_states.dart';

class BottomNavBarCubit extends Cubit<BottomNavBarStates> {
  BottomNavBarCubit() : super(HomeInitial());

  static BottomNavBarCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> bottomNavScreens = [
    const HomeView(),
    const PharmaciesView(),
    const BookingView(),
    const SettingsView(),
  ];

  void changeBottom(int index) {
    currentIndex = index;
    emit(ChangeBottomState());
  }
}
