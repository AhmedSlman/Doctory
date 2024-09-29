// class OffersModel {
//   final String id;
//   final String clinicName;
//   final String image;
//   final String oldPrice;
//   final String price;
//   final String title;
//   final String categoryName;
//   final bool isBooked;


//   OffersModel({
//     required this.id,
//     required this.clinicName,
//     required this.image,
//     required this.oldPrice,
//     required this.price,
//     required this.title,
//     required this.categoryName,

//     this.isBooked = true,
//   });

//   factory OffersModel.fromFirestore(Map<String, dynamic> data, String id, {bool isBooked = false}) {
//     return OffersModel(
//       id: id,
//       clinicName: data['clinicName'] ?? '',
//       image: data['image'] ?? '',
//       oldPrice: data['oldPrice'] ?? '',
//       price: data['price'] ?? '',
//       categoryName: data['categoryName'] ?? '',
//       title: data['title'] ?? '',
//       isBooked: isBooked,
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return {
//       'id': id,
//       'clinicName': clinicName,
//       'image': image,
//       'oldPrice': oldPrice,
//       'price': price,
//       'title': title,
//       'categoryName': categoryName, // Ensure it's being added to the map
//       'isBooked': isBooked, // Add isBooked to the map

//     };
//   }

// }

class City {
  final int id;
  final String name;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  City({
    required this.id,
    required this.name,
    this.createdAt,
    this.updatedAt,
  });

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      id: json['id'],
      name: json['name'],
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at']) : null,
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
    };
  }
}

class Specialization {
  final int id;
  final String name;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Specialization({
    required this.id,
    required this.name,
    this.createdAt,
    this.updatedAt,
  });

  factory Specialization.fromJson(Map<String, dynamic> json) {
    return Specialization(
      id: json['id'],
      name: json['name'],
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at']) : null,
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
    };
  }
}

class OffersModel {
  final int id;
  final String image;
  final String title;
  final String oldPrice;
  final String newPrice;
  final String address;
  final int specializationId;
  final int cityId;
  final int? adminId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final City city;
  final Specialization specialization;

  OffersModel({
    required this.id,
    required this.image,
    required this.title,
    required this.oldPrice,
    required this.newPrice,
    required this.address,
    required this.specializationId,
    required this.cityId,
    this.adminId,
    required this.createdAt,
    required this.updatedAt,
    required this.city,
    required this.specialization,
  });

  factory OffersModel.fromJson(Map<String, dynamic> json) {
    return OffersModel(
      id: json['id'],
      image: json['image'],
      title: json['title'],
      oldPrice: json['OldPrice'],
      newPrice: json['NewPrice'],
      address: json['address'],
      specializationId: json['specialization_id'],
      cityId: json['city_id'],
      adminId: json['admin_id'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      city: City.fromJson(json['city']),
      specialization: Specialization.fromJson(json['specialization']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'image': image,
      'title': title,
      'OldPrice': oldPrice,
      'NewPrice': newPrice,
      'address': address,
      'specialization_id': specializationId,
      'city_id': cityId,
      'admin_id': adminId,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'city': city.toJson(),
      'specialization': specialization.toJson(),
    };
  }
}

