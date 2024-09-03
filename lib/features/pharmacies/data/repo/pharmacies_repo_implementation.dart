import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctory/features/pharmacies/data/repo/pharmacies_repo.dart';
import '../models/pharmacies_model.dart';

class PharmaciesRepoImplementation implements PharmaciesRepo {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<List<PharmaciesModel>> getPharmacies() async {
    final QuerySnapshot<Map<String, dynamic>> snapshot = await _firestore
        .collection('pharmacies')
        .get();

    return snapshot.docs
        .map((doc) => PharmaciesModel.fromFirestore(doc.data(), doc.id))
        .toList();
  }
}
