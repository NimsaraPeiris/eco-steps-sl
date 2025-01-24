import 'package:flutter/foundation.dart';

class AuthProvider with ChangeNotifier {
  bool _isAuthenticated = false;
  String? _userId;

  bool get isAuthenticated => _isAuthenticated;
  String? get userId => _userId;

  Future<void> signIn(String email, String password) async {
    // TODO: Implement actual authentication
    _isAuthenticated = true;
    _userId = 'user123';
    notifyListeners();
  }

  Future<void> signOut() async {
    _isAuthenticated = false;
    _userId = null;
    notifyListeners();
  }
}