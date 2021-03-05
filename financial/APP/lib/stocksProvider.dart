import 'package:dio/dio.dart';
import 'dart:convert';

class StocksProvider {
  static Future<Map> getJson() async {
    final Dio dio = new Dio();

    final apiEndpoint = "http://10.0.2.2:8000/companies";
    // LOCALHOST IN ANDROID IS DIFFERENT 10.0.2.2
    final apiResponse = await dio.get(apiEndpoint);
    var stocks = json.decode(apiResponse.data);
    print("Tenemos ${stocks.length} acciones");
    return stocks;
  }
}
