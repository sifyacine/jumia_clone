import 'package:get/get.dart';
import 'package:jumia_clone/data/repositories/services/firestore_srvices.dart';
import 'package:jumia_clone/features/products/models/product.dart';

class ProductController extends GetxController {
  final FirestoreServices _firestoreServices = FirestoreServices();

  // List to store products fetched from Firestore
  var products = <Product>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  // Method to fetch products from Firestore
  Future<void> fetchProducts() async {
    try {
      isLoading(true);
      final fetchedProducts = await _firestoreServices.getAllProducts();
      products.assignAll(fetchedProducts);
    } finally {
      isLoading(false);
    }
  }
}
