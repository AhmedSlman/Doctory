class Appointment {
  final int id;
  final String name;
  final String phone;
  final String email;
  final String day;
  final String time;
  final int? doctorId;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final DateTime? expiresAt;
  final int isSent;
  final int? offerId;
  final int userId;
  final Doctor? doctor;
  final Offer? offer;

  Appointment({
    required this.id,
    required this.name,
    required this.phone,
    required this.email,
    required this.day,
    required this.time,
    this.doctorId,
    required this.createdAt,
    this.updatedAt,
    this.expiresAt,
    required this.isSent,
    required this.offerId,
    required this.userId,
    this.doctor,
    this.offer,
  });

  factory Appointment.fromJson(Map<String, dynamic> json) {
    return Appointment(
      id: json['id'],
      name: json['name'],
      phone: json['phone'],
      email: json['email'],
      day: json['day'],
      time: json['time'],
      doctorId: json['doctor_id'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'])
          : null,
      expiresAt: json['expires_at'] != null
          ? DateTime.parse(json['expires_at'])
          : null,
      isSent: json['is_sent'],
      offerId: json['offer_id'],
      userId: json['user_id'],
      doctor: json['doctor'] != null ? Doctor.fromJson(json['doctor']) : null,
      offer: json['offer'] != null ? Offer.fromJson(json['offer']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'phone': phone,
      'email': email,
      'day': day,
      'time': time,
      'doctor_id': doctorId,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
      'expires_at': expiresAt?.toIso8601String(),
      'is_sent': isSent,
      'offer_id': offerId,
      'user_id': userId,
      'doctor': doctor?.toJson(),
      'offer': offer?.toJson(),
    };
  }
}

class Doctor {
  final int id;
  final String name;
  final int specializationId;
  final String price;
  final String image;
  final Specialization specialization;

  Doctor({
    required this.id,
    required this.name,
    required this.specializationId,
    required this.price,
    required this.image,
    required this.specialization,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
      id: json['id'],
      name: json['name'],
      specializationId: json['specialization_id'],
      price: json['price'],
      image: json['image'],
      specialization: Specialization.fromJson(json['specialization']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'specialization_id': specializationId,
      'price': price,
      'image': image,
      'specialization': specialization.toJson(),
    };
  }
}

class Specialization {
  final int id;
  final String name;

  Specialization({
    required this.id,
    required this.name,
  });

  factory Specialization.fromJson(Map<String, dynamic> json) {
    return Specialization(
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}

class Offer {
  final int id;
  final String title;
  final String oldPrice;
  final String newPrice;
  final String image;
  final Specialization specialization;

  Offer({
    required this.id,
    required this.title,
    required this.oldPrice,
    required this.newPrice,
    required this.image,
    required this.specialization,
  });

  factory Offer.fromJson(Map<String, dynamic> json) {
    return Offer(
      id: json['id'],
      title: json['title'],
      oldPrice: json['OldPrice'],
      newPrice: json['NewPrice'],
      image: json['image'],
      specialization: Specialization.fromJson(json['specialization']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'OldPrice': oldPrice,
      'NewPrice': newPrice,
      'image': image,
      'specialization': specialization.toJson(),
    };
  }
}
