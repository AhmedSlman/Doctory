import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/categories_model.dart';
import '../models/offer_model.dart';
import 'home_repo.dart';

class HomeRepoImplementation implements HomeRepo {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<List<CategoryModel>> getCategories() async {
    final QuerySnapshot<Map<String, dynamic>> snapshot = await _firestore
        .collection('categories')
        .get();
    return snapshot.docs
        .map((doc) => CategoryModel.fromFirestore(doc.data()..putIfAbsent('id', () => doc.id)))
        .toList();
  }

  @override
  Future<List<OffersModel>> getOffers() async {
    final QuerySnapshot<Map<String, dynamic>> snapshot = await _firestore
        .collection('offers')
        .get();
    return snapshot.docs
        .map((doc) => OffersModel.fromFirestore(doc.data(), doc.id))
        .toList();
  }

}
