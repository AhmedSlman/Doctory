import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/booking_model.dart';
import '../models/categories_model.dart';
import '../models/offer_model.dart';
import 'home_repo.dart';

class HomeRepoImplementation implements HomeRepo {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<List<CategoryModel>> getCategories() async {
    final snapshot = await _firestore.collection('categories').get();
    return snapshot.docs
        .map((doc) => CategoryModel.fromFirestore(doc.data()..putIfAbsent('id', () => doc.id)))
        .toList();
  }

  @override
  Future<List<OffersModel>> getOffers() async {
    final snapshot = await _firestore.collection('offers').get();
    return snapshot.docs
        .map((doc) => OffersModel.fromFirestore(doc.data(), doc.id))
        .toList();
  }

  @override
  Future<void> addBooking(BookingModel booking) async {
    await _firestore.collection('bookings').add(booking.toFirestore());
  }

  @override
  Future<List<BookingModel>> getBookedOffers(String userId) async {
    final snapshot = await _firestore.collection('bookings')
        .where('userId', isEqualTo: userId)
        .get();

    return snapshot.docs
        .map((doc) => BookingModel.fromFirestore(doc.data()))
        .toList();
  }

  @override
  Future<BookingModel?> getUserBookingForOffer(String userId, String offerId) async {
    final snapshot = await _firestore.collection('bookings')
        .where('userId', isEqualTo: userId)
        .where('offerId', isEqualTo: offerId)
        .limit(1) // We only need one result to check if booking exists
        .get();

    if (snapshot.docs.isNotEmpty) {
      return BookingModel.fromFirestore(snapshot.docs.first.data());
    }
    return null; // No booking found for this offer
  }
}
