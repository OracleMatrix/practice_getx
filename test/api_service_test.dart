import 'package:practice_getx/API/api_service.dart';
import 'package:practice_getx/API/auth_api_service.dart';
import 'package:practice_getx/API/news_api_service.dart';
import 'package:practice_getx/API/store_products_api.dart';
import 'package:test/test.dart';

void main() async {
  group(
    'api service group',
    () {
      test(
        'api service get all products should return the title',
        () async {
          final api = APIServices();
          final result = await api.getAllProducts();
          expect(result![1].title, isA<String>());
        },
      );
    },
  );

  group(
    'Auth api service group',
    () {
      test(
        'auth api service login should return the token',
        () async {
          final authApi = AuthApiService();
          final result = await authApi.loginUser('john@mail.com', 'changeme');
          expect(result['access_token'], isA<String>());
        },
      );
    },
  );
  group(
    'Auth api service group',
    () {
      test(
        'currentUserData should return the name in string',
        () async {
          final authApi = AuthApiService();
          final result = await authApi.currentUserData(
              'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjEsImlhdCI6MTczMzk0Mzk3NCwiZXhwIjoxNzM1NjcxOTc0fQ.CSzaMkDmoVzKTpmGZfjENdrAi8zO9zdaE0BSAacxdfM');
          expect(result!.name, isA<String>());
          expect(result.name, isNotNull);
        },
      );
    },
  );

  group(
    'news api service group',
    () {
      test(
        'should return the news',
        () async {
          final newsApi = NewsApiService();
          final result = await newsApi.getAllNews();
          expect(result!.articles![1].title, isA<String>());
          expect(result!.articles![1].title, isNotEmpty);
        },
      );
    },
  );
  group(
    'store products api service group',
    () {
      test(
        'should return the products',
        () async {
          final storeApi = StoreProductsApi();
          final result = await storeApi.getProducts();
          expect(result![1].title, isA<String>());
          expect(result[1].title, isNotEmpty);
        },
      );
    },
  );
}
