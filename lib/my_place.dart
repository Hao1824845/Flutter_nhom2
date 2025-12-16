import 'package:flutter/material.dart';

void main() {
  runApp(const MyPlace());
}

class MyPlace extends StatelessWidget {
  const MyPlace({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // ===== APPBAR có nút quay lại =====
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              Navigator.pop(context); // quay lại menu
            },
          ),
        ),

        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            block1(),
            block2(),
            block3(),
            block4(),
          ],
        ),
      ),
    );
  }
}

// ====== BLOCK 1: HÌNH ẢNH ======
Widget block1() {
  var src = "https://img.lovepik.com/photo/40251/4523.jpg_wh860.jpg";
  return Image.network(
    src,
    height: 200,
    width: double.infinity,
    fit: BoxFit.cover,
  );
}

// ====== BLOCK 2: TIÊU ĐỀ + ĐÁNH GIÁ ======
Widget block2() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "TP.Huế",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 4),
            Text(
              "Lộc An, Phú Lộc, Thành Phố Huế",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
            ),
          ],
        ),
        const Row(
          children: [
            Icon(Icons.star, color: Colors.red),
            SizedBox(width: 4),
            Text(
              "100",
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ],
    ),
  );
}

// ====== BLOCK 3: CÁC NÚT CALL / ROUTE / SHARE ======
Widget block3() {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 16.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        buildButtonColumn(Icons.call, "CALL"),
        buildButtonColumn(Icons.near_me, "ROUTE"),
        buildButtonColumn(Icons.share, "SHARE"),
      ],
    ),
  );
}

Column buildButtonColumn(IconData icon, String label) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Icon(icon, color: Colors.blue),
      const SizedBox(height: 8),
      Text(
        label,
        style: const TextStyle(color: Colors.blue, fontSize: 12),
      ),
    ],
  );
}

// ====== BLOCK 4: NỘI DUNG MÔ TẢ ======
Widget block4() {
  return const Padding(
    padding: EdgeInsets.all(20.0),
    child: Text(
      'Tết Trung thu còn được gọi là Tết trông Trăng hay Tết hoa đăng '
      'theo Âm lịch là ngày Rằm tháng 8 hằng năm, là một lễ hội truyền thống '
      'được kỉ niệm ở văn hóa của Việt Nam. Một văn hoá lâu đời mà chưa rõ nguồn gốc, '
      'nhiều người tin rằng nó bắt nguồn từ Trung Quốc nhưng đến hiện tại đã phát triển '
      'thành ngày trẻ em của Việt Nam. Vào ngày lễ này, các gia đình thường ăn bánh nướng, '
      'bánh dẻo, uống trà hoặc rượu, trẻ em thì đeo mặt nạ, rước đèn lồng. '
      'Cúng rằm cũng là một hoạt động trong ngày lễ này.',
      style: TextStyle(fontSize: 14, height: 1.5),
    ),
  );
}
