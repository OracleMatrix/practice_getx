import 'package:get/get.dart';
import 'package:practice_getx/API/news_api_service.dart';
import 'package:practice_getx/Models/news_model.dart';

class NewsController extends GetxController {
  final NewsApiService _newsApiService = NewsApiService();
  var isLoading = false.obs;
  var news = <Article>[].obs;

  Future fetchAllNews() async {
    isLoading.value = true;
    try {
      final data = await _newsApiService.getAllNews();
      if (data != null) {
        news.assignAll(data.articles!);
      }
    } catch (e) {
      throw Exception("error on fetching news : $e");
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onInit() {
    fetchAllNews();
    super.onInit();
  }
}
