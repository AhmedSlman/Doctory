import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:doctory/core/dataSource/api/api_consumer.dart';
import 'package:doctory/core/dataSource/local/cache.dart';
import 'package:doctory/core/error/exceptions.dart';
import 'package:flutter/foundation.dart';
import '../models/booking_model.dart';
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
      print(data);
      if (data is List) {
        List<CategoryModel> categories = [];
        for (var item in data) {
          categories.add(CategoryModel.fromJson(item));
        }
        print("categories : $categories");
        return Right(categories);
      } else {
        return Left('Unexpected data format');
      }
    } catch (e) {
      return Left('Error when fetching data');
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
      print(data);
      if (data is List) {
        List<OffersModel> offers = [];
        for (var item in data) {
          offers.add(OffersModel.fromJson(item));
        }
        print("offers : $offers");
        return Right(offers);
      } else {
        return Left('Error when catch data');
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

      if (response is List) {
        List<OffersModel> offers = [];
        for (var item in response) {
          offers.add(OffersModel.fromJson(item));
        }
        print("offers : $offers");
        return Right(offers);
      } else {
        return Left('Error when catch data');
      }
    } on ServerException catch (e) {
      return Left(e.errorModel.message);
    }
  }
}
