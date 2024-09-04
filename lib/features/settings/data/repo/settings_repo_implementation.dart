import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctory/features/settings/data/repo/settings_repo.dart';

import '../../../auth/data/models/user_model.dart';
import '../models/report_problem_model.dart';

class SettingsRepoImplementation implements SettingsRepo {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<UserModel> getUserData(String userId) async {
    final doc = await _firestore.collection('users').doc(userId).get();
    return UserModel.fromJson(doc.data()!);
  }

  @override
  Future<void> updateUserData(UserModel user) async {
    await _firestore.collection('users').doc(user.id).update(user.toJson());
  }

  @override
  Future<void> submitReport(ReportProblemModel reportProblem) async {
    try {
      await _firestore.collection('problem_reports').add({
        'problemText': reportProblem.problemText,
        'imageUrl': reportProblem.imageUrl,
        'timestamp': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      throw Exception('Failed to submit report');
    }
  }
}

