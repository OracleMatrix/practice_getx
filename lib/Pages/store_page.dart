import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:practice_getx/Controllers/store_products_controller.dart';
import 'package:practice_getx/Pages/home_page.dart';
import 'package:practice_getx/Pages/user_profile_page.dart';

class StorePage extends StatelessWidget {
  const StorePage({super.key});

  @override
  Widget build(BuildContext context) {
    final StoreProductsController c = Get.find();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        c.fetchAllProducts();
      },
    );
    final box = GetStorage();
    return Scaffold(
        appBar: AppBar(
          title: const Text("S T O R E"),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () => Get.to(() => const UserProfilePage()),
              icon: const Icon(Icons.person),
            ),
            IconButton(
              onPressed: () async {
                await box.remove('access_token');
                await box.erase();
                Get.offAll(const HomePage());
                Get.showSnackbar(const GetSnackBar(
                  duration: Duration(seconds: 3),
                  backgroundColor: Colors.green,
                  title: 'LogOut',
                  message: 'Successfully LongedOut',
                ));
              },
              icon: const Icon(Icons.logout),
            ),
          ],
        ),
        body: Obx(
          () {
            return c.isLoading.value
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    itemCount: c.products.length,
                    itemBuilder: (context, index) {
                      if (c.products.isEmpty) {
                        return const Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.error,
                                size: 100,
                                color: Colors.red,
                              ),
                              Padding(
                                padding: EdgeInsets.all(16.0),
                                child: Text('No Products to show!'),
                              )
                            ],
                          ),
                        );
                      }
                      final product = c.products[index];
                      return Card(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(product?.title ?? 'No title'),
                            ),
                            CachedNetworkImage(
                              imageUrl: product?.images?.first ?? '',
                              errorWidget: (context, url, error) =>
                                  const Center(
                                child: Icon(Icons.error),
                              ),
                              progressIndicatorBuilder:
                                  (context, url, progress) => Center(
                                child: CircularProgressIndicator(
                                  value: progress.progress,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                product?.description ?? 'No description',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                      product?.category?.name ?? 'no category'),
                                  Container(
                                      padding: const EdgeInsets.all(4),
                                      decoration: BoxDecoration(
                                        color: Colors.green,
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                      alignment: Alignment.center,
                                      child: Text(
                                        "\$${product?.price}",
                                        style: const TextStyle(
                                            color: Colors.white),
                                      )),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
          },
        ));
  }
}
