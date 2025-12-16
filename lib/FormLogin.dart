import 'package:flutter/material.dart';
import 'profile_page.dart';

/// ================= AUTH SERVICE =================
class AuthService {
  static final AuthService _instance = AuthService._internal();
  factory AuthService() => _instance;
  AuthService._internal();

  Map<String, dynamic>? _currentUser;

  Future<Map<String, dynamic>> login(String username, String password) async {
    await Future.delayed(const Duration(seconds: 2));

    if (username == 'emilys' && password == 'emilyspass') {
      _currentUser = {
        "id": 1,
        "username": "emilys",
        "firstName": "Emily",
        "lastName": "Smith",
        "email": "emily@example.com",
        "image": "https://i.pravatar.cc/300",
      };
      return {"success": true, "data": _currentUser};
    }
    return {"success": false, "message": "Sai tài khoản hoặc mật khẩu"};
  }

  Future<Map<String, dynamic>> getCurrentUser() async {
    await Future.delayed(const Duration(seconds: 1));
    if (_currentUser != null) {
      return {"success": true, "data": _currentUser};
    }
    return {"success": false, "message": "Chưa đăng nhập"};
  }

  Future<void> logout() async {
    _currentUser = null;
  }
}

/// ================= LOGIN UI =================
class MyLogin extends StatefulWidget {
  const MyLogin({super.key});

  @override
  State<MyLogin> createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _isLoading = false;
  final AuthService _authService = AuthService();

  Future<void> _handleLogin() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);
    final result = await _authService.login(
      _usernameController.text,
      _passwordController.text,
    );
    setState(() => _isLoading = false);

    if (!mounted) return;

    if (result['success'] == true) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const ProfilePage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: _handleLogin,
          child: _isLoading
              ? const CircularProgressIndicator()
              : const Text('Đăng nhập'),
        ),
      ),
    );
  }
}
