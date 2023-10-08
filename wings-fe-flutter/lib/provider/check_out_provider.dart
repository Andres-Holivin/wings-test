import 'package:flutter/material.dart';

import '../models/status_enum.dart';
import '../services/api_service.dart';

class CheckOutProvider extends ChangeNotifier {
  final _service = ApiService();
  Status status = Status.ideal;
  final List<dynamic> _cart = [];
  List<dynamic> get cart => _cart;

  void addProductToCart({required dynamic product}) {
    var idx = -1;
    for (var i = 0; i < _cart.length; i++) {
      if (_cart[i]['productcode'] == product['productcode']) {
        idx = i;
      }
    }
    if (idx != -1) {
      _cart[idx]['quantity'] += 1;
      notifyListeners();
    } else {
      product['quantity'] = 1;
      notifyListeners();
      _cart.add(product);
      return;
    }
  }
}
