import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:practice_getx/Controllers/products_controller.dart';
import 'package:practice_getx/Pages/auth_page.dart';
import 'package:practice_getx/Pages/news_page.dart';
import 'package:practice_getx/Pages/products_detail_page.dart';
import 'package:practice_getx/Pages/store_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final box = GetStorage();
    final ProductsController productsController = Get.find();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('S H O P'),
        actions: [
          IconButton(
            onPressed: () => Get.changeTheme(
              Get.isDarkMode ? ThemeData.light() : ThemeData.dark(),
            ),
            icon: const Icon(Icons.color_lens_outlined),
          ),
          IconButton(
            onPressed: () => Get.to(const NewsPage()),
            icon: const Icon(Icons.newspaper),
          ),
          IconButton(
            onPressed: () {
              final token = box.read('access_token') ?? '';
              if (token.isNotEmpty) {
                Get.to(() => const StorePage());
              } else {
                Get.to(() => const AuthPage());
              }
            },
            icon: const Icon(Icons.store),
          ),
        ],
      ),
      body: Obx(() {
        if (productsController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (productsController.products.isEmpty) {
          return const Center(child: Text('No products available.'));
        }

        return ListView.builder(
          itemCount: productsController.products.length,
          itemBuilder: (context, index) {
            final product = productsController.products[index];
            return InkWell(
              borderRadius: BorderRadius.circular(15),
              onTap: () => Get.to(
                () => ProductsDetailPage(
                  image: product.image,
                  description: product.description,
                  rate: product.rating.rate.toString(),
                  price: product.price.toString(),
                  title: product.title,
                  category: product.category,
                ),
              ),
              child: Card(
                child: ListTile(
                  title: Text(product.title),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(product.category),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("\$${product.price}"),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            padding: const EdgeInsets.all(8),
                            alignment: Alignment.center,
                            child: Row(
                              children: [
                                const Text(
                                  'Rating :',
                                  style: TextStyle(color: Colors.white),
                                ),
                                Text(
                                  product.rating.rate.toString(),
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  leading: CachedNetworkImage(
                    width: 50,
                    height: 50,
                    imageUrl: product.image,
                    errorWidget: (context, url, error) => const Center(
                      child: Icon(Icons.error),
                    ),
                    progressIndicatorBuilder: (context, url, progress) =>
                        Center(
                      child: CircularProgressIndicator(
                        value: progress.progress,
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => productsController.fetchAllProducts(),
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
