import 'package:dio/dio.dart';

const url =
    "https://script.google.com/macros/s/AKfycbyVc3fmjgEForv_2JFGymrwjCrPS44mpV3UtHaUqOhJEnUMROk-JM-qV_aROCqAR2KziQ/exec";

class Api {
  final Dio dio = Dio();

  Api() {
    dio.options.baseUrl = url;
    dio.options.connectTimeout = const Duration(seconds: 10);
    dio.options.receiveTimeout = const Duration(seconds: 10);
  }
  Future<Map<String, String>?> getCurrencyRate() async {
    try {
      final response = await dio.get("");
      if (response.statusCode == 200) {
        return response.data['data'];
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
