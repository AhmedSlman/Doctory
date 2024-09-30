import 'package:dartz/dartz.dart';
import 'package:doctory/features/pharmacies/data/models/pharmacies_model.dart';


abstract class PharmaciesRepo {
     Future<Either<String,List<PharmacyModel>>> getPharmacies();


}