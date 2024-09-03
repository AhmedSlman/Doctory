class PharmaciesModel {
  final String id;
  final String title;
  final String image;
  final String address;
  final String phoneNumber;

  PharmaciesModel({
    required this.id,
    required this.title,
    required this.image,
    required this.address,
    required this.phoneNumber,
  });

  factory PharmaciesModel.fromFirestore(Map<String, dynamic> data, String id) {
    return PharmaciesModel(
      id: id,
      title: data['title'] ?? '',
      image: data['image'] ?? '',
      address: data['address'] ?? '',
      phoneNumber: data['phoneNumber'] ?? '',
    );
  }



}
