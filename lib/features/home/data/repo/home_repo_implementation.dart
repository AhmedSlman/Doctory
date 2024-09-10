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
  Future<List<String>> getBookedOffers(String userId) async {
    final snapshot = await _firestore.collection('bookings')
        .where('userId', isEqualTo: userId)
        .get();

    return snapshot.docs.map((doc) => doc['offerId'] as String).toList();
  }
}
