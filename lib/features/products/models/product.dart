import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  String productID;
  String name;
  String description;
  String category;
  double price;
  double discount;
  int stock;
  List<String> images;
  double rating;
  List<Review> reviews;
  DateTime createdAt;

  Product({
    required this.productID,
    required this.name,
    required this.description,
    required this.category,
    required this.price,
    required this.discount,
    required this.stock,
    required this.images,
    required this.rating,
    required this.reviews,
    required this.createdAt,
  });

  factory Product.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map<String, dynamic>;

    return Product(
      productID: data['productID'] ?? '',
      name: data['name'] ?? '',
      description: data['description'] ?? '',
      category: data['category'] ?? '',
      price: data['price']?.toDouble() ?? 0.0,
      discount: data['discount']?.toDouble() ?? 0.0,
      stock: data['stock'] ?? 0,
      images: List<String>.from(data['images'] ?? []),
      rating: data['rating']?.toDouble() ?? 0.0,
      reviews: (data['reviews'] as List<dynamic>?)
              ?.map((e) => Review.fromMap(e))
              .toList() ??
          [],
      createdAt: (data['createdAt'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'productID': productID,
      'name': name,
      'description': description,
      'category': category,
      'price': price,
      'discount': discount,
      'stock': stock,
      'images': images,
      'rating': rating,
      'reviews': reviews.map((e) => e.toMap()).toList(),
      'createdAt': Timestamp.fromDate(createdAt),
    };
  }
}

class Review {
  String userID;
  double rating;
  String comment;
  DateTime date;

  Review({
    required this.userID,
    required this.rating,
    required this.comment,
    required this.date,
  });

  factory Review.fromMap(Map<String, dynamic> data) {
    return Review(
      userID: data['userID'] ?? '',
      rating: data['rating']?.toDouble() ?? 0.0,
      comment: data['comment'] ?? '',
      date: (data['date'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userID': userID,
      'rating': rating,
      'comment': comment,
      'date': Timestamp.fromDate(date),
    };
  }
}
