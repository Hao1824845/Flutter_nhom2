import 'package:flutter/material.dart';
import 'package:flutter_nhom2/FormLogin.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final AuthService _authService = AuthService();

  Map<String, dynamic>? _userData;
  bool _isLoading = true;
  String? _errorMessage;

  final _firstNameCtrl = TextEditingController();
  final _lastNameCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _phoneCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  @override
  void dispose() {
    _firstNameCtrl.dispose();
    _lastNameCtrl.dispose();
    _emailCtrl.dispose();
    _phoneCtrl.dispose();
    super.dispose();
  }

  Future<void> _loadUserData() async {
    final result = await _authService.getCurrentUser();

    setState(() {
      _isLoading = false;
      if (result['success'] == true) {
        _userData = result['data'];

        _firstNameCtrl.text = _userData!['firstName'] ?? '';
        _lastNameCtrl.text = _userData!['lastName'] ?? '';
        _emailCtrl.text = _userData!['email'] ?? '';
        _phoneCtrl.text = _userData!['phone'] ?? '';
      } else {
        _errorMessage = result['message'];
      }
    });
  }

  Future<void> _handleLogout() async {
    await _authService.logout();
    if (!mounted) return;
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const MyLogin()),
    );
  }

  void _showEditDialog() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Chỉnh sửa thông tin'),
        content: SingleChildScrollView(
          child: Column(
            children: [
              _input(_firstNameCtrl, 'Họ'),
              _input(_lastNameCtrl, 'Tên'),
              _input(_emailCtrl, 'Email'),
              _input(_phoneCtrl, 'Số điện thoại'),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Hủy'),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _userData!['firstName'] = _firstNameCtrl.text;
                _userData!['lastName'] = _lastNameCtrl.text;
                _userData!['email'] = _emailCtrl.text;
                _userData!['phone'] = _phoneCtrl.text;
              });
              Navigator.pop(context);

              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Cập nhật thành công')),
              );
            },
            child: const Text('Lưu'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Thông tin cá nhân'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: _userData == null ? null : _showEditDialog,
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: _handleLogout,
          ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _errorMessage != null
              ? Center(child: Text(_errorMessage!))
              : _userData == null
                  ? const Center(child: Text('Không có dữ liệu'))
                  : ListView(
                      padding: const EdgeInsets.all(16),
                      children: [
                        Center(
                          child: CircleAvatar(
                            radius: 60,
                            child: const Icon(Icons.person, size: 60),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Center(
                          child: Text(
                            '${_userData!['firstName']} ${_userData!['lastName']}',
                            style: const TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(height: 20),
                        _infoTile(
                            Icons.email, 'Email', _userData!['email'] ?? ''),
                        _infoTile(Icons.phone, 'Số điện thoại',
                            _userData!['phone'] ?? ''),
                      ],
                    ),
    );
  }

  Widget _infoTile(IconData icon, String title, String value) {
    return Card(
      child: ListTile(
        leading: Icon(icon),
        title: Text(title),
        subtitle: Text(value),
      ),
    );
  }

  Widget _input(TextEditingController c, String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextField(
        controller: c,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}
