import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/booking_model.dart';
import '../../../data/models/offer_model.dart';
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

      // Load booking status
      final userId = FirebaseAuth.instance.currentUser!.uid;
      final bookedOffers = await homeRepo.getBookedOffers(userId);

      final offersWithBookingStatus = offers.map((offer) {
        final isBooked = bookedOffers.any((booking) => booking.offerId == offer.id);
        return OffersModel(
          id: offer.id,
          clinicName: offer.clinicName,
          image: offer.image,
          oldPrice: offer.oldPrice,
          price: offer.price,
          title: offer.title,
          categoryName: offer.categoryName,
          isBooked: isBooked,
        );
      }).toList();

      if (!isClosed) {
        emit(HomeLoaded(categories: categories, offers: offersWithBookingStatus));
      }
    } catch (e) {
      if (!isClosed) {
        emit(HomeError("Failed to fetch home data"));
      }
    }
  }
  Future<List<BookingModel>> _getBookedOffersForUser(String userId) async {
    final bookings = await homeRepo.getBookedOffers(userId);
    return bookings;
  }

  Future<void> filterOffersByCategory(String categoryName) async {
    try {
      emit(HomeLoading());

      final categories = await homeRepo.getCategories();
      final allOffers = await homeRepo.getOffers();

      final filteredOffers = allOffers.where((offer) {
        return offer.categoryName == categoryName;
      }).toList();

      final userId = FirebaseAuth.instance.currentUser!.uid;
      final bookedOffers = await _getBookedOffersForUser(userId);

      final filteredOffersWithBookingStatus = filteredOffers.map((offer) {
        final isBooked = bookedOffers.any((booking) => booking.offerId == offer.id);
        return OffersModel(
          id: offer.id,
          clinicName: offer.clinicName,
          image: offer.image,
          oldPrice: offer.oldPrice,
          price: offer.price,
          title: offer.title,
          categoryName: offer.categoryName,
          isBooked:isBooked
        );
      }).toList();

      if (!isClosed) {
        emit(HomeLoaded(categories: categories, offers: filteredOffersWithBookingStatus));
      }
    } catch (e) {
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
