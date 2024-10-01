class Profile {
  final int id;
  final String name;
  final String email;
  final String phone;
  final bool isMale;
  final DateTime birthdate;
  final DateTime? emailVerifiedAt;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? verifiedAt;
  final String? verificationCode;

  Profile({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.isMale,
    required this.birthdate,
    this.emailVerifiedAt,
    required this.createdAt,
    required this.updatedAt,
    this.verifiedAt,
    this.verificationCode,
  });

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      isMale: json['is_male'] == 1,
      birthdate: DateTime.parse(json['birthdate']),
      emailVerifiedAt: json['email_verified_at'] != null
          ? DateTime.parse(json['email_verified_at'])
          : null,
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      verifiedAt: json['verified_at'] != null
          ? DateTime.parse(json['verified_at'])
          : null,
      verificationCode: json['verification_code'],
    );
  }

    Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'is_male': isMale ? 1 : 0,
      'birthdate': birthdate.toIso8601String(),
      'email_verified_at': emailVerifiedAt?.toIso8601String(),
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'verified_at': verifiedAt?.toIso8601String(),
      'verification_code': verificationCode,
    };
  }
}