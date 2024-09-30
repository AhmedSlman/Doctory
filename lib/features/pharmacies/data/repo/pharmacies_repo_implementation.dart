import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:doctory/core/dataSource/api/api_consumer.dart';
import 'package:doctory/core/dataSource/local/cache.dart';
import 'package:doctory/features/pharmacies/data/repo/pharmacies_repo.dart';
import '../models/pharmacies_model.dart';

class PharmaciesRepoImplementation implements PharmaciesRepo {

    final ApiConsumer apiConsumer;

  PharmaciesRepoImplementation({required this.apiConsumer});

  @override
  Future<Either<String, List<PharmacyModel>>> getPharmacies() async{
    try {
            final token = CacheHelpers.getToken();

      var data = await apiConsumer.get('/pharmacies', headers: {
        'Accept': 'application/vnd.api+json',
        'Content-Type': 'application/vnd.api+json',
                'Authorization': "Bearer $token"

      });
      print(data);
      if (data is List) {
        List<PharmacyModel> pharmacy = [];
        for (var item in data) {
          pharmacy.add(PharmacyModel.fromJson(item));
        }
        print("pharmacy : $pharmacy");
        return Right(pharmacy);
      } else {
        return Left('Unexpected data format');
      }
    } catch (e) {
      return Left('Error when fetching data');
    }
  }
}
