import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:practice_getx/Models/products_model.dart';

class APIServices extends GetConnect {
  Future<List<AllProductsModel>?> getAllProducts() async {
    try {
      final response = await get('https://fakestoreapi.com/products');

      if (response.statusCode == 200) {
        return allProductsModelFromJson(response.bodyString!);
      } else {
        Get.snackbar("Error", "Failed to load products");
      }
    } catch (e) {
      Get.snackbar(
        'Error on get all products',
        "$e",
        onTap: (snack) => Get.defaultDialog(content: Text(e.toString())),
      );
    }
    return null;
  }
}
