import 'package:flutter/material.dart';

import '../models/status_enum.dart';
import '../services/api_service.dart';

class LoginProvider extends ChangeNotifier {
  final _service = ApiService();
  Status status = Status.ideal;
  String? _username;
  String? get username => _username;

  Future<void> loginUser(
      {required String username, required String password}) async {
    status = Status.loading;
    notifyListeners();
    final response =
        await _service.getUser(username: username, password: password);
    if (response.isEmpty) {
      status = Status.failed;
    } else {
      _username = response['username'];
      status = Status.success;
    }
    print(_username);
    notifyListeners();
  }
}
