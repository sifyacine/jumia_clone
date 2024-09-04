import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jumia_clone/features/products/models/category.dart';
import 'package:jumia_clone/features/products/models/product.dart';

class FirestoreServices {
  final CollectionReference productsCollectionProducts =
      FirebaseFirestore.instance.collection('products');
      
  final CollectionReference categoriesCollectionCategories =
      FirebaseFirestore.instance.collection('categories');

  /// Adds a new product to Firestore
  Future<void> addProduct(Product product) async {
    try {
      await productsCollectionProducts
          .doc(product.productID)
          .set(product.toFirestore());
      print('Product added successfully!');
    } catch (e) {
      print('Failed to add product: $e');
    }
  }

  /// Fetches a single product by productID
  Future<Product?> getProductByID(String productID) async {
    try {
      DocumentSnapshot doc = await productsCollectionProducts.doc(productID).get();
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

  /// Fetches all products
  Future<List<Product>> getAllProducts() async {
    try {
      QuerySnapshot querySnapshot = await productsCollectionProducts.get();
      return querySnapshot.docs
          .map((doc) => Product.fromFirestore(doc))
          .toList();
    } catch (e) {
      print('Failed to fetch products: $e');
      return [];
    }
  }

  /// Updates a product by productID
  Future<void> updateProduct(
      String productID, Map<String, dynamic> updatedData) async {
    try {
      await productsCollectionProducts.doc(productID).update(updatedData);
      print('Product updated successfully!');
    } catch (e) {
      print('Failed to update product: $e');
    }
  }

  /// Deletes a product by productID
  Future<void> deleteProduct(String productID) async {
    try {
      await productsCollectionProducts.doc(productID).delete();
      print('Product deleted successfully!');
    } catch (e) {
      print('Failed to delete product: $e');
    }
  }

  /// Listens to real-time updates of all products
  Stream<List<Product>> listenToProducts() {
    return productsCollectionProducts.snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => Product.fromFirestore(doc)).toList());
  }

  /// Fetches products by category
  Future<List<Product>> getProductsByCategory(String category) async {
    try {
      QuerySnapshot querySnapshot =
          await productsCollectionProducts.where('category', isEqualTo: category).get();
      return querySnapshot.docs
          .map((doc) => Product.fromFirestore(doc))
          .toList();
    } catch (e) {
      print('Failed to fetch products by category: $e');
      return [];
    }
  }

  /// Searches products by name
  Future<List<Product>> searchProductsByName(String searchQuery) async {
    try {
      QuerySnapshot querySnapshot = await productsCollectionProducts
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


  /************************************************* */


   // Fetches all categories
  Future<List<Category>> getAllCategories() async {
    try {
      QuerySnapshot querySnapshot = await categoriesCollectionCategories.get();
      return querySnapshot.docs
          .map((doc) => Category.fromFirestore(doc))
          .toList();
    } catch (e) {
      print('Failed to fetch categories: $e');
      return [];
    }
  }

    // Fetches a single category by categoryID
  Future<Category?> getCategoryByID(String categoryID) async {
    try {
      DocumentSnapshot doc = await categoriesCollectionCategories.doc(categoryID).get();
      if (doc.exists) {
        return Category.fromFirestore(doc);
      } else {
        print('Category not found!');
        return null;
      }
    } catch (e) {
      print('Failed to fetch category: $e');
      return null;
    }
  }

  // Adds a new category to Firestore
  Future<void> addCategory(Category category) async {
    try {
      await categoriesCollectionCategories
          .doc(category.categoryID)
          .set(category.toFirestore());
      print('Category added successfully!');
    } catch (e) {
      print('Failed to add category: $e');
    }
  }

  // Updates a category by categoryID
  Future<void> updateCategory(String categoryID, Map<String, dynamic> updatedData) async {
    try {
      await categoriesCollectionCategories.doc(categoryID).update(updatedData);
      print('Category updated successfully!');
    } catch (e) {
      print('Failed to update category: $e');
    }
  }

  // Deletes a category by categoryID
  Future<void> deleteCategory(String categoryID) async {
    try {
      await categoriesCollectionCategories.doc(categoryID).delete();
      print('Category deleted successfully!');
    } catch (e) {
      print('Failed to delete category: $e');
    }
  }
}

