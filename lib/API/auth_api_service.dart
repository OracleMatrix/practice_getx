import 'package:get/get.dart';
import 'package:practice_getx/Models/current_user_data_model.dart';

class AuthApiService extends GetConnect {
  Future loginUser(String email, String password) async {
    try {
      final response = await post(
        'https://api.escuelajs.co/api/v1/auth/login',
        {
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 201) {
        return response.body;
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to login user :\n$e',
        duration: const Duration(seconds: 5),
      );
    }
  }

  Future<CurrentUserData?> currentUserData(String accessToken) async {
    try {
      final response = await get(
        'https://api.escuelajs.co/api/v1/auth/profile',
        headers: {'Authorization': "Bearer $accessToken"},
      );

      if (response.statusCode == 200) {
        return currentUserDataFromJson(response.bodyString!);
      }
    } catch (e) {
      Get.snackbar('Error', 'Error on getting user data $e');
    }
    return null;
  }
}
