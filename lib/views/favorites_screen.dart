import 'package:coin_app/controllers/favorite_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoritesScreen extends StatelessWidget {
  final FavoritesController controller = Get.put(FavoritesController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return ListView.builder(
        itemCount: controller.favorites.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(controller.favorites[index].name),
            // Other details...
            trailing: IconButton(
              icon: const Icon(Icons.favorite),
              color: Colors.red,
              onPressed: () {
                controller.toggleFavorite(controller.favorites[index]);
              },
            ),
          );
        },
      );
    });
  }
}
