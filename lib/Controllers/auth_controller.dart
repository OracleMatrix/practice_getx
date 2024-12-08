import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:practice_getx/API/auth_api_service.dart';
import 'package:practice_getx/Models/current_user_data_model.dart';
import 'package:practice_getx/Pages/store_page.dart';

class AuthController extends GetxController {
  final AuthApiService _apiService = AuthApiService();
  var emailController = TextEditingController().obs;
  var passwordController = TextEditingController().obs;
  var isLoading = false.obs;
  var data = CurrentUserData().obs;
  final box = GetStorage();

  Future<bool> getUser(String email, String password) async {
    try {
      isLoading.value = true;
      final data = await _apiService.loginUser(email, password);
      await box.write('access_token', data['access_token']);
      Get.off(const StorePage());
      return true;
    } catch (e) {
      Get.snackbar('Error', 'Error on getting user : $e');
      return false;
    } finally {
      isLoading.value = false;
    }
  }

  Future getCurrentUserData(String accessToken) async {
    try {
      isLoading.value = true;
      final userData = await _apiService.currentUserData(accessToken);
      return data.value = userData!;
    } catch (e) {
      Get.snackbar('Error', 'Error on getting user : $e');
    } finally {
      isLoading.value = false;
    }
  }
}
