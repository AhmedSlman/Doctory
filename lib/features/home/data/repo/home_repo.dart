import 'package:dartz/dartz.dart';
import 'package:doctory/features/home/data/models/booking_model.dart';
import 'package:doctory/features/home/data/models/categories_model.dart';

import '../models/offer_model.dart';

abstract class HomeRepo {
  Future<Either<String,List<CategoryModel>>> getCategories();
   Future<Either<String,List<OffersModel>>> getOffers();
   Future<Either<String,List<OffersModel>>> getOffersBySpecialization(String specializationName);
  // Future<void> addBooking(BookingModel booking);
  // Future<List<BookingModel>>getBookedOffers(String userId);
  // Future<BookingModel?> getUserBookingForOffer(String userId, String offerId);



}
