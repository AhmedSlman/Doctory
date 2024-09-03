class GridViewItemModel {
  final String id;
  final String clinicName;
  final String image;
  final String oldPrice;
  final String price;
  final String title;

  GridViewItemModel({
    required this.id,
    required this.clinicName,
    required this.image,
    required this.oldPrice,
    required this.price,
    required this.title,
  });

  factory GridViewItemModel.fromFirestore(Map<String, dynamic> data, String id) {
    return GridViewItemModel(
      id: id,
      clinicName: data['clinicName'] ?? '',
      image: data['image'] ?? '',
      oldPrice: data['oldPrice'] ?? '',
      price: data['price'] ?? '',
      title: data['title'] ?? '',
    );
  }



}
