import 'package:flutter/material.dart';

import '../models/status_enum.dart';
import '../services/api_service.dart';

class CheckOutProvider extends ChangeNotifier {
  final _service = ApiService();
  Status status = Status.ideal;
  List<dynamic> _cart = [];
  List<dynamic> get cart => _cart;

  void addProductToCart({required dynamic product}) {
    _cart.map((e) {
      if (e['productcode'] == product['productcode']) {
        e['quantity'] += 1;
        notifyListeners();
        return;
      }
    });
    product['quantity'] = 1;
    _cart.add(product);
    notifyListeners();
    return;
  }
}
