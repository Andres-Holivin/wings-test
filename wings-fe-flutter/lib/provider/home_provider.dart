import 'package:flutter/material.dart';

import '../models/status_enum.dart';
import '../services/api_service.dart';

class HomeProvider extends ChangeNotifier {
  final _service = ApiService();
  Status status = Status.ideal;
  List<dynamic> _product = [];
  List<dynamic> get product => _product;

  Future<void> getProduct() async {
    status = Status.loading;
    notifyListeners();
    final response = await _service.getProduct();
    if (response.isEmpty) {
      status = Status.failed;
    } else {
      _product = response;
      status = Status.success;
    }
    print(_product);
    notifyListeners();
  }
}
