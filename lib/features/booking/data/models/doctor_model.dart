import 'package:doctory/features/home/data/models/offer_model.dart';

class DoctorModel {
  final int id;
  final String name;
  final String? image;
  final String price;
  final String address;
  final int cityId;
  final int specializationId;
  final City? city;
  final Specialization? specialization;

  DoctorModel({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.address,
    required this.cityId,
    required this.specializationId,
    required this.city,
    required this.specialization,
  });

  factory DoctorModel.fromJson(Map<String, dynamic> json) {
    return DoctorModel(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      price: json['price'],
      address: json['address'],
      cityId: json['city_id'],
      specializationId: json['specialization_id'],
      city: City.fromJson(json['city']),
      specialization: Specialization.fromJson(json['specialization']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'price': price,
      'address': address,
      'city_id': cityId,
      'specialization_id': specializationId,
      'city': city?.toJson(),
      'specialization': specialization?.toJson(),
    };
  }
}
