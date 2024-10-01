import 'package:dartz/dartz.dart';
import 'package:doctory/features/settings/data/models/profile_model.dart';


abstract class SettingsRepo {
  Future<Either<String,Profile>> getUserData();
  Future<Profile> updateUserData(Profile user);
  //Future<void> submitReport(ReportProblemModel reportProblem);
  //Future<void> updatePassword(String oldPassword, String newPassword);
 // Future<List<BookingModel>> getBookedOffers(String userId);
}
