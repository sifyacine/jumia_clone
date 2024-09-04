import 'package:get/get.dart';
import 'package:jumia_clone/data/repositories/services/firestore_srvices.dart';
import 'package:jumia_clone/features/products/models/category.dart';


class CategoryController extends GetxController {
  final FirestoreServices _firestoreServices = FirestoreServices();

  var categories = <Category>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchCategories();
  }

  Future<void> fetchCategories() async {
    try {
      isLoading(true);
      final fetchedCategories = await _firestoreServices.getAllCategories();
      categories.assignAll(fetchedCategories);
    } finally {
      isLoading(false);
    }
  }

  List<String> get categoryNames {
    return categories.map((category) => category.name).toList();
  }

  List<String> getSubCategoriesForCategory(String categoryName) {
    final category = categories.firstWhere(
        (category) => category.name == categoryName,
        orElse: () => Category(
          categoryID: '',
          name: '',
          description: '',
          image: '',
          subCategories: [],
        ));
    return category.subCategories;
  }

  
}
