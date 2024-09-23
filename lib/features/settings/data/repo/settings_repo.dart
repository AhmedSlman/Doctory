import 'package:doctory/features/home/data/models/booking_model.dart';
import 'package:doctory/features/home/data/models/offer_model.dart';

import '../../../auth/data/models/user_model.dart';
import '../models/report_problem_model.dart';

abstract class SettingsRepo {
  Future<UserModelStatic> getUserData(String userId);
  Future<void> updateUserData(UserModelStatic user);
  Future<void> submitReport(ReportProblemModel reportProblem);
  Future<void> updatePassword(String oldPassword, String newPassword);
  Future<List<BookingModel>> getBookedOffers(String userId);



}