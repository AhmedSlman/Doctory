import '../models/doctor_model.dart';

abstract class DoctorsRepo {
  Future<List<DoctorModel>> fetchDoctors();
}
