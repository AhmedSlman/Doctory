
import 'package:dartz/dartz.dart';
import 'package:doctory/core/dataSource/api/api_consumer.dart';
import 'package:doctory/core/dataSource/local/cache.dart';
import 'package:doctory/core/error/exceptions.dart';
import 'package:doctory/features/home/data/models/booking_model.dart';
import 'package:intl/intl.dart';
import '../models/categories_model.dart';
import '../models/offer_model.dart';
import 'home_repo.dart';

class HomeRepoImplementation implements HomeRepo {
  final ApiConsumer apiConsumer;

  HomeRepoImplementation({required this.apiConsumer});

  @override
  Future<Either<String, List<CategoryModel>>> getCategories() async {
    try {
      var data = await apiConsumer.get('/specializations', headers: {
        'Accept': 'application/vnd.api+json',
        'Content-Type': 'application/vnd.api+json',
      });
      // print(data);
      if (data is List) {
        List<CategoryModel> categories = [];
        for (var item in data) {
          categories.add(CategoryModel.fromJson(item));
        }
        // print("categories : $categories");
        return Right(categories);
      } else {
        return const Left('Unexpected data format');
      }
    } catch (e) {
      return const Left('Error when fetching data');
    }
  }

  @override
  Future<Either<String, List<OffersModel>>> getOffers() async {
    try {
      final token = CacheHelpers.getToken();
      var data = await apiConsumer.get('/offers', headers: {
        'Accept': 'application/vnd.api+json',
        'Content-Type': 'application/vnd.api+json',
        'Authorization': "Bearer $token"
      });
      // print(data);
      if (data is List) {
        List<OffersModel> offers = [];
        for (var item in data) {
          offers.add(OffersModel.fromJson(item));
        }
        // print("offers : $offers");
        return Right(offers);
      } else {
        return const Left('Error when catch data');
      }
    } on ServerException catch (e) {
      return Left(e.errorModel.message);
    }
  }



//getOffersBySpecialization
  @override
  Future<Either<String, List<OffersModel>>> getOffersBySpecialization(
      String specializationName) async {
    try {
      final token = CacheHelpers.getToken();
      var response =
          await apiConsumer.post('/getOffersBySpecialization', data: {
        'name': specializationName
      }, headers: {
        'Accept': 'application/vnd.api+json',
        'Content-Type': 'application/vnd.api+json',
        'Authorization': "Bearer $token"
      });
  print(response.data);
      if (response.data is List) {
        List<OffersModel> offers = [];
        for (var item in response.data) {
          offers.add(OffersModel.fromJson(item));
       }
        return Right(offers);
     } else {
        return const Left('No Offer ');
      }
    } on ServerException catch (e) {
      return Left(e.errorModel.message);
    }
  }
  
  @override
 Future<Either<String, String>> reserveOffer(BookingModel booking) async {
  try {
    final token = CacheHelpers.getToken();

    // تنسيق التاريخ والوقت
    final formattedDate = DateFormat('yyyy-MM-dd').format(booking.bookingDate);
    final formattedTime = booking.bookingTime; // تم تنسيقه مسبقًا ليكون HH:mm

    var response = await apiConsumer.post('/offers/${booking.offerId}/reserve',
      data: {
        'name': booking.patientName,
        'email': booking.email,
        'phone': booking.phone,
        'day': formattedDate, // إرسال التاريخ بتنسيق yyyy-MM-dd
        'time': formattedTime, // إرسال الوقت بتنسيق HH:mm
      }, headers: {
        'Accept': 'application/vnd.api+json',
        'Content-Type': 'application/vnd.api+json',
        'Authorization': "Bearer $token"
      });

    if (response.statusCode == 200 || response.statusCode == 201) {
      final message = response.data['message'];
      return Right(message);
    } else {
      return Left(response.data['message']);
    }
  } catch (e) {
    return Left('Error occurred: $e');
  }
}
}
