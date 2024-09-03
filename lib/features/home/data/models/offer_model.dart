class OffersModel {
  final String id;
  final String clinicName;
  final String image;
  final String oldPrice;
  final String price;
  final String title;

  OffersModel({
    required this.id,
    required this.clinicName,
    required this.image,
    required this.oldPrice,
    required this.price,
    required this.title,
  });

  factory OffersModel.fromFirestore(Map<String, dynamic> data, String id) {
    return OffersModel(
      id: id,
      clinicName: data['clinicName'] ?? '',
      image: data['image'] ?? '',
      oldPrice: data['oldPrice'] ?? '',
      price: data['price'] ?? '',
      title: data['title'] ?? '',
    );
  }



}
