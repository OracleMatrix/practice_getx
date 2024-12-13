import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:practice_getx/Controllers/auth_controller.dart';
import 'package:practice_getx/Controllers/news_controller.dart';
import 'package:practice_getx/Controllers/products_controller.dart';
import 'package:practice_getx/Controllers/store_products_controller.dart';
import 'package:practice_getx/Pages/home_page.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class InitializeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProductsController());
    Get.lazyPut(() => NewsController());
    Get.lazyPut(() => StoreProductsController());
    Get.lazyPut(() => AuthController());
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: InitializeBinding(),
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      debugShowCheckedModeBanner: false,
      title: 'GetX practice',
      home: const HomePage(),
    );
  }
}
