import '../../../auth/data/models/user_model.dart';
import '../models/report_problem_model.dart';

abstract class SettingsRepo {
  Future<UserModel> getUserData(String userId);
  Future<void> updateUserData(UserModel user);
  Future<void> submitReport(ReportProblemModel reportProblem);
  Future<void> updatePassword(String oldPassword, String newPassword);


}