import 'dart:math';
import 'package:flutter/material.dart';

class ColorChangerApp extends StatefulWidget {
  const ColorChangerApp({super.key});

  @override
  State<ColorChangerApp> createState() => _ColorChangerAppState();
}

class _ColorChangerAppState extends State<ColorChangerApp> {
  // Danh sách màu và tên tương ứng
  final List<Map<String, dynamic>> colorList = [
    {'color': Colors.purple, 'name': 'Tím'},
    {'color': Colors.orange, 'name': 'Cam'},
    {'color': Colors.blue, 'name': 'Xanh dương'},
    {'color': Colors.green, 'name': 'Xanh lá'},
    {'color': Colors.red, 'name': 'Đỏ'},
  ];

  late Color currentColor;
  late String currentName;

  @override
  void initState() {
    super.initState();
    currentColor = colorList[0]['color'];
    currentName = colorList[0]['name'];
  }

  void changeColor() {
    final random = Random();
    final randomIndex = random.nextInt(colorList.length);
    setState(() {
      currentColor = colorList[randomIndex]['color'];
      currentName = colorList[randomIndex]['name'];
    });
  }

  void resetColor() {
    setState(() {
      currentColor = colorList[0]['color'];
      currentName = colorList[0]['name'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ứng dụng Đổi màu nền"),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Container(
        color: currentColor,
        width: double.infinity,
        height: double.infinity,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Màu hiện tại:",
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
              Text(
                currentName,
                style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: changeColor,
                    child: const Text("Đổi màu"),
                  ),
                  const SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: resetColor,
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
                    child: const Text("Reset"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
