class UserModel {
  final String email;
  final String name;
  final String phone;
  final bool isMale;
  final DateTime birthdate;

  UserModel({
    required this.email,
    required this.name,
    required this.phone,
    required this.isMale,
    required this.birthdate,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json['email'],
      name: json['name'],
      phone: json['phone'],
      isMale: json['is_male'] == '1',
      birthdate: DateTime.parse(json['birthdate']),
    );
  }
}
