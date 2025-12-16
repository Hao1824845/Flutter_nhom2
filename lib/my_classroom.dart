import 'package:flutter/material.dart';

class MyClassroom extends StatelessWidget {
  const MyClassroom({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('Lớp học của tôi',
            style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          block1(
            'XML và ứng dụng - Nhóm 1',
            '2025-2026.1.TIN4583.001',
            58,
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRcZyqf-Ceu78Aae2vMvBxqg3HcB_pEIj0dOg&s',
          ),
          block1(
            'Lập trình ứng dụng cho các thiết bị di động - Nhóm 6',
            '2025-2026.1.TIN4403.006',
            55,
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRkHLrKa4QrjI3HTelApXxjp-UVgpGLyrTQEQ&s',
          ),
          block1(
            'Lập trình ứng dụng cho các thiết bị di động - Nhóm 5',
            '2025-2026.1.TIN4403.005',
            52,
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRvlwJcGtW4SyvzmGCZsWnIX8RAMhKXU6YUUw&s',
          ),
          block1(
            'Lập trình ứng dụng cho các thiết bị di động - Nhóm 4',
            '2025-2026.1.TIN4403.004',
            50,
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ3WQXw6lgp2SHuTDid_dBWmI-W3_3a1HkIKQ&s',
          ),
          block1(
            'Lập trình ứng dụng cho các thiết bị di động - Nhóm 3',
            '2025-2026.1.TIN4403.003',
            52,
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT-8Jzu1SGC8MkSVmsTceeErdHIAGfNKu4X4Q&s',
          ),
        ],
      ),
    );
  }

  // 🔹 BLOCK 1: Thẻ lớp học với học viên ở dưới cùng
  Widget block1(String title, String code, int students, String imageUrl) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      height: 130,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
          colorFilter:
              ColorFilter.mode(Colors.black.withOpacity(0.35), BlendMode.darken),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Stack(
          children: [
            // Dấu 3 chấm góc phải trên
            Positioned(top: 0, right: 0, child: block2()),

            // Nội dung chính
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [Text(
                  title,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 5),
                Text(
                  code,
                  style: const TextStyle(color: Colors.white70, fontSize: 13),
                ),
                const Spacer(), // 🔽 đẩy dòng học viên xuống dưới cùng
                Text(
                  '$students học viên',
                  style: const TextStyle(color: Colors.white, fontSize: 13),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // 🔹 BLOCK 2: Dấu ba chấm góc phải trên
  Widget block2() {
    return PopupMenuButton<String>(
      icon: const Icon(Icons.more_vert, color: Colors.white),
      onSelected: (value) {},
      itemBuilder: (context) => [
        const PopupMenuItem(value: 'xem', child: Text('Xem chi tiết')),
        const PopupMenuItem(value: 'rời', child: Text('Rời lớp học')),
      ],
    );
  }
}