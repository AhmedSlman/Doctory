import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/booking_model.dart';
import '../../../data/repo/home_repo.dart';
import 'home_state.dart';




import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/booking_model.dart';
import '../../../data/repo/home_repo.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo homeRepo;

  HomeCubit(this.homeRepo) : super(HomeInitial());

  Future<void> getHomeData() async {
    try {
      emit(HomeLoading());

      final categories = await homeRepo.getCategories();
      final offers = await homeRepo.getOffers();

      if (!isClosed) {
        emit(HomeLoaded(categories: categories, offers: offers));
      }
    } catch (e) {
      if (!isClosed) {
        emit(HomeError("Failed to fetch home data"));
      }
    }
  }

  Future<void> filterOffersByCategory(String categoryName) async {
    try {
      emit(HomeLoading());

      final categories = await homeRepo.getCategories();
      final allOffers = await homeRepo.getOffers();

      print('Selected Category: $categoryName');
      print('All Offers: $allOffers');

      final filteredOffers = allOffers.where((offer) {
        print('Checking Offer: ${offer.categoryName}');
        return offer.categoryName == categoryName;
      }).toList();

      print("Filtered Offers: $filteredOffers");

      if (!isClosed) {
        emit(HomeLoaded(categories: categories, offers: filteredOffers));
      }
    } catch (e) {
      print('Error filtering offers: $e');
      if (!isClosed) {
        emit(HomeError("Failed to filter offers"));
      }
    }
  }

  Future<bool> hasUserBookedOffer(String offerId, String userId) async {
    final booking = await homeRepo.getUserBookingForOffer(userId, offerId);
    return booking != null;
  }

  Future<void> bookOffer(BookingModel booking) async {
    final existingBooking = await homeRepo.getUserBookingForOffer(booking.userId, booking.offerId);

    if (existingBooking != null) {
      emit(BookingError('You have already booked this offer.'));
      return;
    }

    try {
      emit(BookingLoading());
      await homeRepo.addBooking(booking);
      emit(BookingSuccess());
    } catch (e) {
      emit(BookingError('Failed to book the offer.'));
    }
  }
}
