class UserModelStatic {
  final String id;
  final String name;
  final String email;
  final String phoneNumber;
  final String birthDate;
  final String gender;

  UserModelStatic( {
    required this.id,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.birthDate,
    required this.gender,
  });
  factory UserModelStatic.fromJson(Map<String, dynamic> json) {
    return UserModelStatic(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      birthDate: json['birthDate'],
      gender: json['gender'],

    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
      'birthDate': birthDate,
      'gender': gender,

    };
  }
} 
////////////////////////////////////////////////////////////////////////////////////
///from Api 
class UserModel {
  String? message;
  UserData? data;

  UserModel({ this.message, this.data});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
     
      message: json['message'],
      data: json['data'] != null ? UserData.fromJson(json['data']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      
      'message': message,
      'data': data?.toJson(),
    };
  }
}

class UserData {
  User? user;
  String? token;

  UserData({this.user, this.token});

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      user: json['user'] != null ? User.fromJson(json['user']) : null,
      token: json['token'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user': user?.toJson(),
      'token': token,
    };
  }
}

class User {
  int? id;
  String? name;
  String? email;
  String? phone;
  int? isMale;
  String? birthdate;
  String? emailVerifiedAt;
  String? createdAt;
  String? updatedAt;
  String? verifiedAt;
  String? verificationCode;

  User({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.isMale,
    this.birthdate,
    this.emailVerifiedAt,
    this.createdAt,
    this.updatedAt,
    this.verifiedAt,
    this.verificationCode,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      isMale: json['is_male'],
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
      'is_male': isMale,
      'birthdate': birthdate,
      'email_verified_at': emailVerifiedAt,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'verified_at': verifiedAt,
      'verification_code': verificationCode,
    };
  }
}
