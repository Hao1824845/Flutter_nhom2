import 'package:flutter/material.dart';
import 'package:flutter_nhom2/CounterApp.dart';
import 'package:flutter_nhom2/my_classroom.dart';
import 'package:flutter_nhom2/ColorChangerApp.dart';
import 'package:flutter_nhom2/feedback.dart';
import 'package:flutter_nhom2/newspage.dart';
import 'package:flutter_nhom2/Formlogin.dart';
import 'package:flutter_nhom2/FormRegister.dart';
import 'package:flutter_nhom2/my_name.dart';
import 'package:flutter_nhom2/my_place.dart';
import 'package:flutter_nhom2/profile_page.dart';
import 'package:flutter_nhom2/my_product.dart';
import 'package:flutter_nhom2/my_home_page.dart';
import 'package:flutter_nhom2/tinh_chi_so_BMI.dart';

class TongKetCuoiNam extends StatelessWidget {
  const TongKetCuoiNam({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,

      // ================= APPBAR =================
      appBar: AppBar(
        title: const Text(
          "TỔNG HỢP BÀI FLUTTER",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor:
            const Color.fromARGB(255, 238, 232, 232).withOpacity(0.4),
        elevation: 0,
      ),

      // ================= DRAWER =================
      drawer: Drawer(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/menu.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            color: Colors.black.withOpacity(0.65),
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
                _menuItem(context, "Bài 1: MyPlace", MyPlace()),
                _menuItem(context, "Bài 2: MyClassroom", const MyClassroom()),
                _menuItem(context, "Bài 3: CounterApp", CounterApp()),
                _menuItem(context, "Bài 4: MyLogin", MyLogin()),
                _menuItem(context, "Bài 4: MyRegister", MyRegister()),
                _menuItem(context, "Bài 5: PhanHoi", PhanHoi()),
                _menuItem(context, "Bài 6: BMI", TinhBMI()),
                _menuItem(
                    context, "Bài 7: ColorChangerApp ", ColorChangerApp()),
                _menuItem(context, "Bài 8: MyName", const MyName()),
                _menuItem(context, "Bài 9: Product", MyProduct()),
                _menuItem(context, "Bài 10: MyNewsPage", MyNewsPage()),
                _menuItem(context, "Bài 11: ProfilePage", ProfilePage()),
                _menuItem(context, "Bài 12: MyHomepage", const MyHomepage()),
              ],
            ),
          ),
        ),
      ),

      // ================= BODY =================
      body: Stack(
        children: [
          // ===== BACKGROUND =====
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/giao_dien.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // ===== OVERLAY MỜ =====
          Container(
            color: Colors.black.withOpacity(0.35),
          ),

          // ===== LOGO GÓC PHẢI =====
          Positioned(
            top: 90,
            right: 20,
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black38,
                    blurRadius: 8,
                    offset: Offset(2, 3),
                  ),
                ],
              ),
              child: ClipOval(
                child: Image.asset(
                  'assets/flutter_logo.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          // ===== NỘI DUNG CHÍNH =====
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "TỔNG KẾT CUỐI NĂM",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 2,
                    shadows: [
                      Shadow(
                        blurRadius: 8,
                        color: Color.fromARGB(255, 247, 245, 245),
                        offset: Offset(3, 3),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "MÔN FLUTTER",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w600,
                    color: Colors.white70,
                    letterSpacing: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ================= MENU ITEM =================
  static Widget _menuItem(BuildContext context, String title, Widget page) {
    return ListTile(
      leading: const Icon(Icons.book, color: Colors.white),
      title: Text(
        title,
        style: const TextStyle(color: Colors.white, fontSize: 17),
      ),
      onTap: () {
        Navigator.pop(context);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => page),
        );
      },
    );
  }
}
