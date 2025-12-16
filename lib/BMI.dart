import 'package:flutter/material.dart';

void main() {
  runApp(const BMICalculatorApp());
}

class BMICalculatorApp extends StatelessWidget {
  const BMICalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BMIScreen(),
    );
  }
}

class BMIScreen extends StatefulWidget {
  const BMIScreen({super.key});

  @override
  _BMIScreenState createState() => _BMIScreenState();
}

class _BMIScreenState extends State<BMIScreen> {
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();

  double? bmi;
  String? classification;

  void calculateBMI() {
    double? height = double.tryParse(heightController.text);
    double? weight = double.tryParse(weightController.text);

    if (height == null || weight == null || height <= 0 || weight <= 0) {
      setState(() {
        bmi = null;
        classification = "Dữ liệu không hợp lệ!";
      });
      return;
    }

    double result = weight / (height * height);

    setState(() {
      bmi = double.parse(result.toStringAsFixed(2));
      classification = getClassification(result);
    });
  }

  String getClassification(double bmi) {
    if (bmi < 18.5) return "Thiếu cân";
    if (bmi < 25) return "Bình thường";
    if (bmi < 30) return "Thừa cân";
    return "Béo phì";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF4F4F7),
      appBar: AppBar(
        title: Text("Tính chỉ số BMI"),
        centerTitle: true,
        backgroundColor: Color(0xFF0F8C64), // màu xanh giống ảnh 2
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: heightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Chiều cao (m)",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 15),
            TextField(
              controller: weightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Cân nặng (kg)",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),

            // Nút giống ảnh 2
            OutlinedButton.icon(
              onPressed: calculateBMI,
              icon: Icon(Icons.calculate, color: Color(0xFF0F8C64)),
              label: Text(
                "Tính BMI",
                style: TextStyle(color: Color(0xFF0F8C64)),
              ),
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: Color(0xFF0F8C64), width: 2),
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 12),
              ),
            ),

            SizedBox(height: 20),

            if (bmi != null)
              Column(
                children: [
                  Text(
                    "Chỉ số BMI: $bmi",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: bmi! >= 30 ? Colors.red : Colors.black,
                    ),
                  ),
                  Text(
                    "Phân loại: $classification",
                    style: TextStyle(
                      fontSize: 20,
                      color: bmi! >= 30 ? Colors.red : Colors.blue,
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
