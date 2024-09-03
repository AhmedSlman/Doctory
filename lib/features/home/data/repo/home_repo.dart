import 'package:doctory/features/home/data/models/categories_model.dart';

import '../models/offer_model.dart';

abstract class HomeRepo {
  Future<List<CategoryModel>> getCategories();
  Future<List<OffersModel>> getOffers();


}