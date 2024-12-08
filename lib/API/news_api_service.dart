import 'package:get/get.dart';
import 'package:practice_getx/Models/news_model.dart';

class NewsApiService extends GetConnect {
  Future<NewsModel?> getAllNews() async {
    try {
      final response = await get(
          'https://newsapi.org/v2/everything?q=bitcoin&apiKey=ae70f501447e4095826bee9bae10ff45');

      if (response.statusCode == 200) {
        return allNewsModelFromJson(response.bodyString!);
      } else {
        Get.snackbar('Error', "Error on getting all news!");
      }
    } catch (e) {
      throw Exception("Error on getting news : $e");
    }
    return null;
  }
}
