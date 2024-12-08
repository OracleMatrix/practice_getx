import 'package:get/get.dart';
import 'package:practice_getx/Models/store_products_model.dart';

class StoreProductsApi extends GetConnect {
  Future<List<StoreProductsModel>?> getProducts() async {
    try {
      final response = await get('https://api.escuelajs.co/api/v1/products');
      if (response.statusCode == 200) {
        return storeProductsModelFromJson(response.bodyString!);
      }
    } catch (e) {
      Get.snackbar('Error', 'Error on getting all products from API :\n$e');
    }
    return null;
  }
}
