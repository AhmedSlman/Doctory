class LoginResponse {
  final String message;
  final Data data;

  LoginResponse({
    required this.message,
    required this.data,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      message: json['message'],
      data: Data.fromJson(json['data']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'data': data.toJson(),
    };
  }
}

class Data {
  final User user;
  final String token;

  Data({
    required this.user,
    required this.token,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      user: User.fromJson(json['user']),
      token: json['token'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user': user.toJson(),
      'token': token,
    };
  }
}

class User {
  final int id;
  final String name;
  final String email;
  final String phone;
  final bool isMale;
  final String birthdate;
  final String? emailVerifiedAt;
  final String createdAt;
  final String updatedAt;
  final String? verifiedAt;
  final String? verificationCode;

  User({
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

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      isMale: json['is_male'] == 1,
      birthdate: json['birthdate'],
      emailVerifiedAt: json['email_verified_at'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      verifiedAt: json['verified_at'],
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
      'birthdate': birthdate,
      'email_verified_at': emailVerifiedAt,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'verified_at': verifiedAt,
      'verification_code': verificationCode,
    };
  }
}
