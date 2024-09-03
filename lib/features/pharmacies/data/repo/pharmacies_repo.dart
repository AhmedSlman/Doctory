import 'package:doctory/features/home/data/models/categories_model.dart';
import 'package:doctory/features/pharmacies/data/models/pharmacies_model.dart';


abstract class PharmaciesRepo {
  Future<List<PharmaciesModel>> getPharmacies();

}