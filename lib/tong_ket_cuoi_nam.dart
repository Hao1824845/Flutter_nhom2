import 'package:flutter/material.dart';
import 'package:flutter_nhom2/CounterApp.dart';
import 'package:flutter_nhom2/HomeScreen.dart';
import 'package:flutter_nhom2/my_classroom.dart';
import 'package:flutter_nhom2/ColorChangerApp.dart';
import 'package:flutter_nhom2/feedback.dart';
import 'package:flutter_nhom2/newspage.dart';
import 'package:flutter_nhom2/login.dart';
import 'package:flutter_nhom2/my_product.dart';
import 'package:flutter_nhom2/my_name.dart';
import 'package:flutter_nhom2/my_hart.dart';
import 'package:flutter_nhom2/my_place.dart';
import 'package:flutter_nhom2/profile_page.dart';
import 'BMI.dart';

class TongKetCuoiNam extends StatelessWidget {
  const TongKetCuoiNam({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TỔNG HỢP BÀI FLUTTER"),
        centerTitle: true,
      ),

      // ================= DRAWER MENU =================
      drawer: Drawer(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/menu.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            color: Colors.black.withOpacity(0.6),
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                const DrawerHeader(
                  child: Center(
                    child: Text(
                      "DANH SÁCH BÀI",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                _menuItem(context, "Bài 1: HomePage", HomeScreen()),
                _menuItem(context, "Bài 2: MyClassroom", const MyClassroom()),
                _menuItem(context, "Bài 3", CounterApp()),
                _menuItem(context, "Bài 4", DangNhapScreen()),
                _menuItem(context, "Bài 5", MyHart()),
                _menuItem(context, "Bài 6", PhanHoi()),
                _menuItem(context, "Bài 7", BMICalculatorApp()),
                _menuItem(context, "Bài 8", CounterApp()),
                _menuItem(context, "Bài 9", ColorChangerApp()),
                _menuItem(context, "Bài 10", const MyName()),
                _menuItem(context, "Bài 11", MyProduct()),
                _menuItem(context, "Bài 12", MyPlace()),
                _menuItem(context, "Bài 13", MyNewsPage()),
                _menuItem(context, "Bài 14", ProfilePage()),
              ],
            ),
          ),
        ),
      ),

      // ================= BODY TRANG CHỦ (ĐÃ CHÈN HÌNH) =================
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/giao_dien.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // ===== HÌNH 1 =====
              Image.asset(
                'assets/flutter_logo.png',
                width: 160,
              ),

              const SizedBox(height: 20),

              // ===== TEXT =====
              const Text(
                'TỔNG KẾT CUỐI NĂM\nMÔN FLUTTER',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20),

              // ===== HÌNH 2 =====
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  'https://upload.wikimedia.org/wikipedia/commons/1/17/Google-flutter-logo.png',
                  width: 200,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ================= MENU ITEM =================
  Widget _menuItem(BuildContext context, String title, Widget page) {
    return ListTile(
      leading: const Icon(Icons.book, color: Colors.white),
      title: Text(
        title,
        style: const TextStyle(color: Colors.white, fontSize: 18),
      ),
      onTap: () {
        Navigator.pop(context);
        Navigator.push(context, MaterialPageRoute(builder: (_) => page));
      },
    );
  }
}
