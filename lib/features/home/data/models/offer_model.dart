class OffersModel {
  final String id;
  final String clinicName;
  final String image;
  final String oldPrice;
  final String price;
  final String title;
  final bool isBooked;

  OffersModel({
    required this.id,
    required this.clinicName,
    required this.image,
    required this.oldPrice,
    required this.price,
    required this.title,
    this.isBooked = false,
  });

  factory OffersModel.fromFirestore(Map<String, dynamic> data, String id, {bool isBooked = false}) {
    return OffersModel(
      id: id,
      clinicName: data['clinicName'] ?? '',
      image: data['image'] ?? '',
      oldPrice: data['oldPrice'] ?? '',
      price: data['price'] ?? '',
      title: data['title'] ?? '',
      isBooked: isBooked,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'clinicName': clinicName,
      'image': image,
      'oldPrice': oldPrice,
      'price': price,
      'title': title,
      'isBooked': isBooked, // Add isBooked to the map

    };
  }

}
