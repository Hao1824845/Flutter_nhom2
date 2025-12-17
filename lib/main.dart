import 'package:flutter/material.dart';
import 'tong_ket_cuoi_nam.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Access",
      home: TongKetCuoiNam(),
    );
  }
}
