class PharmacyModel {
  final int id;
  final String name;
  final String image;
  final String phone;
  final int? adminId;
  final DateTime createdAt;
  final DateTime updatedAt;

  PharmacyModel({
    required this.id,
    required this.name,
    required this.image,
    required this.phone,
    this.adminId,
    required this.createdAt,
    required this.updatedAt,
  });

  // Factory method to create a PharmacyModel from JSON
  factory PharmacyModel.fromJson(Map<String, dynamic> json) {
    return PharmacyModel(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      phone: json['phone'],
      adminId: json['admin_id'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }
}
