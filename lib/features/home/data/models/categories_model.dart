class CategoryModel {
  final String id;
  final String name;

  CategoryModel({required this.id, required this.name});

  factory CategoryModel.fromFirestore(Map<String, dynamic> firestore) {
    return CategoryModel(
      id: firestore['id'],
      name: firestore['name'],
    );
  }
}