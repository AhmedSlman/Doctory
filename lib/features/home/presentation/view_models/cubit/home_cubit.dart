import 'package:doctory/features/booking/presentation/views/booking_view.dart';
import 'package:doctory/features/home/presentation/views/home_view.dart';
import 'package:doctory/features/pharmacies/presentation/views/pharmacies_view.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'home_states.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitial());
  static HomeCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<Widget> bottomNavScreens = [
    const BookingView(),
    const PharmaciesView(),
    const HomeView(),


    //const SettingsView()
  ];
  // to move rtl
  void changeBottom(int index) {
    currentIndex =index;
    emit(ChangeBottomState());
  }



}
