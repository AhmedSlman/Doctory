import 'package:doctory/features/home/data/models/offer_model.dart';

class DoctorProfileModel {
  final int id;
  final String name;
  final String? image;
  final String price;
   final String? details;
   final String waitingTime;
  final String address;
  final City? city;
  final Specialization? specialization;

  DoctorProfileModel({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.details,
    required this.waitingTime,
    required this.address,
    required this.city,
    required this.specialization,
  });

  factory DoctorProfileModel.fromJson(Map<String, dynamic> json) {
    return DoctorProfileModel(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      price: json['price'],
     details: json['details'],
     waitingTime: json['waiting_time'],
      address: json['address'],
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
      'details': details,
      'waiting_time': waitingTime,
      'address': address,
      'city': city?.toJson(),
      'specialization': specialization?.toJson(),
    };
  }
}
