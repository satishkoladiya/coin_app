import 'package:dio/dio.dart';

class APIRepository {
  final Dio dio;

  APIRepository(this.dio);

  Future<Response?> getAPICall(
      {required String method, required Map<String, dynamic> header}) async {
    try {
      final response = await dio.get(method, options: Options(headers: header));
      if (response.statusCode == 200) {
        return response;
      } else {
        Future.error(response.statusMessage.toString());
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}
