import 'package:get/get.dart';
import 'package:jumia_clone/data/repositories/services/firestore_srvices.dart';
import 'package:jumia_clone/features/products/models/product.dart';

class ProductController extends GetxController {
  final FirestoreServices _firestoreServices = FirestoreServices();

  // Observable list to store all products fetched from Firestore
  var products = <Product>[].obs;

  // Observable map to store filtered products based on category
  var filteredProductsByCategory = <String, List<Product>>{}.obs;

  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchAllProducts();
  }

  // Method to fetch all products from Firestore
  Future<void> fetchAllProducts() async {
  try {
    isLoading(true);
    final fetchedProducts = await _firestoreServices.getAllProducts();
    products.assignAll(fetchedProducts);
    
    print("Fetched products: ${fetchedProducts.length}"); // Debugging statement
    fetchedProducts.forEach((product) {
      print("Product: ${product.name}, Category: ${product.category}"); // Additional debug to see product details
    });

    // Initialize categories in the map
    final categories = fetchedProducts.map((product) => product.category).toSet();
    filteredProductsByCategory.assignAll({
      for (var category in categories) category: []
    });

    print("Categories found: ${categories.join(', ')}");
  } catch (e) {
    print("Error fetching products: $e"); // Catch any errors
  } finally {
    isLoading(false);
  }
}


  void filterProductsByCategory(String category) {
  if (products.isNotEmpty) {
    final filtered = products.where((product) {
      final match = product.category.trim().toLowerCase() == category.trim().toLowerCase();
      print("Filtering for category: $category, Product category: ${product.category}, Match: $match"); // Debugging statement
      return match;
    }).toList();

    filteredProductsByCategory[category] = filtered;

    // Debugging print statements
    print("Filtered products count for category '$category': ${filtered.length}");
  } else {
    print("No products available for filtering.");
  }
}

}
