import 'package:dio/dio.dart';

const url =
    "https://script.google.com/macros/s/AKfycby3GV2_K_WTvF5qtqiAk29oDlvRx0v57zcQ3Gnwi_afjLdd7673YDH4b-4d-CJdHr7e/exec";

class Api {
  final Dio dio = Dio();

  Api() {
    dio.options.baseUrl = url;
    dio.options.connectTimeout = const Duration(seconds: 10);
    dio.options.receiveTimeout = const Duration(seconds: 10);
  }
  Future<Map<String, dynamic>?> getCurrencyRate() async {
    try {
      final response = await dio.get("");
      if (response.statusCode == 200) {
        return response.data;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
