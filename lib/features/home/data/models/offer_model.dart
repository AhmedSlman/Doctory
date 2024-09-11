class OffersModel {
  final String id;
  final String clinicName;
  final String image;
  final String oldPrice;
  final String price;
  final String title;
  final String categoryName;
  final bool isBooked;


  OffersModel({
    required this.id,
    required this.clinicName,
    required this.image,
    required this.oldPrice,
    required this.price,
    required this.title,
    required this.categoryName,

    this.isBooked = false,
  });

  factory OffersModel.fromFirestore(Map<String, dynamic> data, String id, {bool isBooked = false}) {
    return OffersModel(
      id: id,
      clinicName: data['clinicName'] ?? '',
      image: data['image'] ?? '',
      oldPrice: data['oldPrice'] ?? '',
      price: data['price'] ?? '',
      categoryName: data['categoryName'] ?? '',
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
      'categoryName': categoryName, // Ensure it's being added to the map
      'isBooked': isBooked, // Add isBooked to the map

    };
  }

}
