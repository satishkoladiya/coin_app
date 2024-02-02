import 'package:coin_app/controllers/current_crypto_currencies_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CurrentCryptoCurrenciesScreen extends StatelessWidget {
  CurrentCryptoCurrenciesScreen({Key? key}) : super(key: key);

  final CurrentCryptoCurrenciesController controller = Get.put(
    CurrentCryptoCurrenciesController(),
  );

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.isLoading.isTrue
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : RefreshIndicator(
              onRefresh: () async {
                await controller.refreshData();
              },
              child: ListView.builder(
                itemBuilder: (context, index) {
                  final crypto = controller.cryptoList[index];
                  return ListTile(
                    title: Text(
                      crypto.name,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    subtitle: Text(
                      crypto.symbol,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  );
                },
                itemCount: controller.cryptoList.length,
                shrinkWrap: true,
              ),
            ),
    );
  }
}
