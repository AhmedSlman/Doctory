class GridViewItemModel {
  final String image;
  final String title;
  final String? oldPrice;
  final String? newPrice;
  final String? clinicName;
  final String? address;
  final String? phoneNumber;


  GridViewItemModel({
    required this.image,
    required this.title,
     this.oldPrice,
     this.newPrice,
     this.clinicName,
     this.address,
     this.phoneNumber,
  });

}