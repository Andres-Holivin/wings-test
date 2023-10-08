import 'package:flutter/material.dart';

import '../models/status_enum.dart';
import '../services/api_service.dart';

class ProductDetailProvider extends ChangeNotifier {
  final _service = ApiService();
  Status status = Status.ideal;
  dynamic _detail;
  dynamic get detail => _detail;

  Future<void> getDetailProduct({required String code}) async {
    status = Status.loading;
    notifyListeners();
    final response = await _service.getProductDetail(productCode: code);
    if (response.isEmpty) {
      status = Status.failed;
    } else {
      _detail = response;
      status = Status.success;
    }
    print(_detail['productname']);
    notifyListeners();
  }
}
