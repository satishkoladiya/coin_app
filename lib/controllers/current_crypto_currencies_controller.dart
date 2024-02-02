import 'package:coin_app/consts/app_const.dart';
import 'package:coin_app/models/models.dart';
import 'package:coin_app/repository/api_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CurrentCryptoCurrenciesController extends GetxController {
  late final APIRepository repository;
  RxList<Crypto> cryptoList = <Crypto>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    repository = APIRepository(Dio(BaseOptions(
      receiveDataWhenStatusError: true,
      baseUrl: AppConstant.baseURL,
      contentType: 'application/json',
    )));
    super.onInit();
    fetchData();
  }

  Future<void> fetchData({bool refreshData = false}) async {
    try {
      isLoading.value = true;
      final response = await repository.getAPICall(
        method: AppConstant.priceEndPoint,
        header: {
          'X-CMC_PRO_API_KEY': '2592e201-7cb0-41b4-81d5-abacc60ac4ee',
        },
      );
      if (response?.statusCode == 200) {
        cryptoList.value = (response!.data['data'] as List)
            .map((data) => Crypto.fromJson(data))
            .toList();
      }
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> refreshData() async {
    fetchData(refreshData: true);
  }
}
