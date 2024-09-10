import 'package:cloud_firestore/cloud_firestore.dart';


import 'package:cloud_firestore/cloud_firestore.dart';

class DoctorModel {
  final String doctorId;
  final String image;
  final String name;
  final String doctorSpec;
  final String address;
  final double rating;
  final String doctorSummary;
  final List<String> doctorServices; // This will now be a list of services
  final double price;
  final String waitingTime;
  final String fullAddress;

  DoctorModel({
    required this.doctorId,
    required this.image,
    required this.name,
    required this.doctorSpec,
    required this.address,
    required this.rating,
    required this.doctorSummary,
    required this.doctorServices,
    required this.price,
    required this.waitingTime,
    required this.fullAddress,
  });

  factory DoctorModel.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>? ?? {};

    // Convert the doctorServices map to a list of strings
    List<String> services = [];
    if (data['doctorServices'] != null) {
      data['doctorServices'].forEach((key, value) {
        services.add(value);
      });
    }

    return DoctorModel(
      doctorId: doc.id,
      image: data['image'] ?? '',
      name: data['name'] ?? '',
      doctorSpec: data['doctorSpec'] ?? '',
      address: data['address'] ?? '',
      rating: (data['rating'] ?? 0.0).toDouble(),
      doctorSummary: data['doctorSummary'] ?? '',
      doctorServices: services,
      price: (data['price'] ?? 0.0).toDouble(),
      waitingTime:data['waitingTime'] ?? '',
      fullAddress:data['fullAddress'] ?? '',
    );
  }
}

