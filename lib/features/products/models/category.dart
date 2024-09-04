import 'package:cloud_firestore/cloud_firestore.dart';

class Category {
  String categoryID;
  String name;
  String description;
  String image;
  List<String> subCategories;

  Category({
    required this.categoryID,
    required this.name,
    required this.description,
    required this.image,
    required this.subCategories,
  });

  // Factory constructor to create a Category instance from a Firestore document
  factory Category.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

    return Category(
      categoryID: doc.id, // Using the document ID as categoryID
      name: data['name'] ?? '',
      description: data['description'] ?? '',
      image: data['image'] ?? '',
      subCategories: List<String>.from(data['sub-categories'] ?? []),
    );
  }

  // Method to convert a Category instance to a Firestore-compatible map
  Map<String, dynamic> toFirestore() {
    return {
      'name': name,
      'description': description,
      'image': image,
      'sub-categories': subCategories,
    };
  }
}
