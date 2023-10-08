import 'dart:convert';

import 'package:dio/dio.dart';

const url = 'http://localhost:8001';

class ApiService {
  final dio = Dio();
  Future<Map<String, dynamic>> getUser(
      {required String username, required String password}) async {
    try {
      Response? response = await dio.post(url + '/users',
          options: Options(contentType: "application/json"),
          data: {'username': username, 'password': password});
      print(response);
      return response.data;
    } on Exception catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<List<dynamic>> getProduct() async {
    try {
      Response? response = await dio.get(url + '/product');
      return response.data;
    } on Exception catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<dynamic> getProductDetail({required String productCode}) async {
    try {
      Response? response =
          await dio.get(url + '/product/detail/${productCode}');
      return response.data;
    } on Exception catch (e) {
      print(e);
      rethrow;
    }
  }
}
