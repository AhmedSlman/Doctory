import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctory/features/booking/data/repo/doctors_repo.dart';

import '../models/doctor_model.dart';

class DoctorsRepoImplementation implements DoctorsRepo {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Fetch doctors from Firestore
  @override
  Future<List<DoctorModel>> fetchDoctors() async {
    try {
      QuerySnapshot snapshot = await _firestore.collection('doctors').get();
      return snapshot.docs
          .map((doc) => DoctorModel.fromFirestore(doc))
          .toList();
    } catch (e) {
      throw Exception('Error fetching doctors: $e');
    }
  }


}
