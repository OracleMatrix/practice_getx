import 'package:get/get.dart';
import 'package:practice_getx/API/api_service.dart';
import 'package:practice_getx/Models/products_model.dart';

class ProductsController extends GetxController {
  final APIServices _apiServices = APIServices();

  var products = <AllProductsModel>[].obs;
  var isLoading = false.obs;

  Future fetchAllProducts() async {
    try {
      isLoading.value = true;
      final fetchedProducts = await _apiServices.getAllProducts();
      if (fetchedProducts != null) {
        products.value = fetchedProducts;
      } else {
        products.clear();
      }
    } catch (e) {
      Get.snackbar('Error on Fetching All products', "$e");
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onInit() {
    fetchAllProducts();
    super.onInit();
  }
}
