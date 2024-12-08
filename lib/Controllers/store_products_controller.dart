import 'package:get/get.dart';
import 'package:practice_getx/API/store_products_api.dart';
import 'package:practice_getx/Models/store_products_model.dart';

class StoreProductsController extends GetxController {
  final StoreProductsApi _productsApi = StoreProductsApi();
  var isLoading = false.obs;
  var products = <StoreProductsModel?>[].obs;

  Future fetchAllProducts() async {
    try {
      isLoading.value = true;
      final data = await _productsApi.getProducts();
      return products.assignAll(data!);
    } catch (e) {
      Get.snackbar('Error', 'Error on fetching products in controller :\n$e');
    } finally {
      isLoading.value = false;
    }
  }
}
