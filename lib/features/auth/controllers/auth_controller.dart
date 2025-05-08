import 'package:flutter/material.dart';
import '../models/user_model.dart';

class AuthController extends ChangeNotifier {
  User? _currentUser;
  bool _isLoading = false;
  String? _error;

  User? get currentUser => _currentUser;
  bool get isLoading => _isLoading;
  String? get error => _error;
  bool get isAuthenticated => _currentUser != null;

  Future<bool> login(String email, String password) async {
    try {
      _isLoading = true;
      _error = null;
      notifyListeners();

      // TODO: Implement actual API login
      await Future.delayed(const Duration(seconds: 1));
      _currentUser = User(
        id: '1',
        name: 'John Doe',
        email: email,
        userType: 'tourist',
        createdAt: DateTime.now(),
      );

      _isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  Future<bool> signup({
    required String name,
    required String email,
    required String password,
    required String userType,
  }) async {
    try {
      _isLoading = true;
      _error = null;
      notifyListeners();

      // TODO: Implement actual API signup
      await Future.delayed(const Duration(seconds: 1));
      _currentUser = User(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        name: name,
        email: email,
        userType: userType,
        createdAt: DateTime.now(),
      );

      _isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  void logout() {
    _currentUser = null;
    notifyListeners();
  }

  void clearError() {
    _error = null;
    notifyListeners();
  }
}
