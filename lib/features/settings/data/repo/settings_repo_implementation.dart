import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctory/features/home/data/models/booking_model.dart';
import 'package:doctory/features/settings/data/repo/settings_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../auth/data/models/user_model.dart';
import '../../../home/data/models/offer_model.dart';
import '../models/report_problem_model.dart';

class SettingsRepoImplementation implements SettingsRepo {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<UserModel> getUserData(String userId) async {
    final doc = await _firestore.collection('users').doc(userId).get();
    return UserModel.fromJson(doc.data()!);
  }

  // @override
  // Future<void> updateUserData(UserModel user) async {
  //   await _firestore.collection('users').doc(user.id as String?).update(user.toJson());
  // }

  @override
  Future<void> submitReport(ReportProblemModel reportProblem) async {
    try {
      await _firestore.collection('problem_reports').add({
        'problemText': reportProblem.problemText,
        'imageUrl': reportProblem.image,
        'timestamp': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      throw Exception('Failed to submit report');
    }
  }

  @override
  Future<void> updatePassword(String oldPassword, String newPassword) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final credentials = EmailAuthProvider.credential(
        email: user.email!,
        password: oldPassword,
      );
      try {
        await user.reauthenticateWithCredential(credentials);
        await user.updatePassword(newPassword);
      } catch (e) {
        throw Exception('Failed to update password');
      }
    } else {
      throw Exception('No user logged in');
    }
  }

  @override
  Future<List<BookingModel>> getBookedOffers(String userId) async {
    final snapshot = await _firestore
        .collection('bookings')
        .where('userId', isEqualTo: userId)
        .get();

    return snapshot.docs
        .map((doc) => BookingModel.fromFirestore(doc.data()))
        .toList();
  }

  @override
  Future<void> updateUserData(UserModel user) {
    // TODO: implement updateUserData
    throw UnimplementedError();
  }
}
