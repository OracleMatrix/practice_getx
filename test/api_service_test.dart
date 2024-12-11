import 'package:practice_getx/API/api_service.dart';
import 'package:test/test.dart';

void main() {
  group('api service group', () {
    test('api service get all products should return the title', () async {
      final api = APIServices();
      final result = await api.getAllProducts();
      expect(result![1].title, isNotEmpty);
    },);
  },);
}
