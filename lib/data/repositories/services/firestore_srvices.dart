import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jumia_clone/features/products/models/product.dart';

class FirestoreServices {
  /// Collection reference to 'products'
  final CollectionReference productsCollection =
      FirebaseFirestore.instance.collection('products');

  /// Function to add a new product to Firestore
  Future<void> addProduct(Product product) async {
    try {
      await productsCollection
          .doc(product.productID)
          .set(product.toFirestore());
      print('Product added successfully!');
    } catch (e) {
      print('Failed to add product: $e');
    }
  }

  /// Function to fetch a single product by productID
  Future<Product?> getProductByID(String productID) async {
    try {
      DocumentSnapshot doc = await productsCollection.doc(productID).get();
      if (doc.exists) {
        return Product.fromFirestore(doc);
      } else {
        print('Product not found!');
        return null;
      }
    } catch (e) {
      print('Failed to fetch product: $e');
      return null;
    }
  }

  /// Function to fetch all products
  Future<List<Product>> getAllProducts() async {
    try {
      QuerySnapshot querySnapshot = await productsCollection.get();
      return querySnapshot.docs
          .map((doc) => Product.fromFirestore(doc))
          .toList();
    } catch (e) {
      print('Failed to fetch products: $e');
      return [];
    }
  }

  /// Function to update a product by productID
  Future<void> updateProduct(
      String productID, Map<String, dynamic> updatedData) async {
    try {
      await productsCollection.doc(productID).update(updatedData);
      print('Product updated successfully!');
    } catch (e) {
      print('Failed to update product: $e');
    }
  }

  /// Function to delete a product by productID
  Future<void> deleteProduct(String productID) async {
    try {
      await productsCollection.doc(productID).delete();
      print('Product deleted successfully!');
    } catch (e) {
      print('Failed to delete product: $e');
    }
  }

  /// Function to listen to real-time updates of all products
  Stream<List<Product>> listenToProducts() {
    return productsCollection.snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => Product.fromFirestore(doc)).toList());
  }

  /// Function to get products by category
  Future<List<Product>> getProductsByCategory(String category) async {
    try {
      QuerySnapshot querySnapshot =
          await productsCollection.where('category', isEqualTo: category).get();
      return querySnapshot.docs
          .map((doc) => Product.fromFirestore(doc))
          .toList();
    } catch (e) {
      print('Failed to fetch products by category: $e');
      return [];
    }
  }

  /// Function to search products by name
  Future<List<Product>> searchProductsByName(String searchQuery) async {
    try {
      QuerySnapshot querySnapshot = await productsCollection
          .where('name', isGreaterThanOrEqualTo: searchQuery)
          .where('name', isLessThanOrEqualTo: '$searchQuery\uf8ff')
          .get();
      return querySnapshot.docs
          .map((doc) => Product.fromFirestore(doc))
          .toList();
    } catch (e) {
      print('Failed to search products by name: $e');
      return [];
    }
  }
}
