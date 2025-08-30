import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  String? _userId;
  String? get userId => _userId;

  void setUser(String id) {
    _userId = id;
    notifyListeners();
  }

  void logout() {
    _userId = null;
    notifyListeners();
  }
}
