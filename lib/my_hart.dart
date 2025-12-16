import 'package:flutter/material.dart';

// Đây là một trang/ widget độc lập mô phỏng giao diện trong ảnh đính kèm.
// Hướng dẫn ngắn: đặt `MyHart()` làm home trong `MaterialApp` (ví dụ trong `main.dart`) để xem.

class MyHart extends StatelessWidget {
  const MyHart({super.key});

  // Dữ liệu mẫu — thay bằng dữ liệu thực của bạn khi cần
  static final List<Course> _courses = [
    Course(
      title: 'XML và ứng dụng - Nhóm 1',
      code: '2025-2026.1.TIN4583.001',
      students: 58,
      colors: [Color(0xFF3A4451), Color(0xFF2B2F36)],
    ),
    Course(
      title: 'Lập trình ứng dụng cho các t...',
      code: '2025-2026.1.TIN4403.006',
      students: 55,
      colors: [Color(0xFF51577B), Color(0xFF8A6E6E)],
    ),
    Course(
      title: 'Lập trình ứng dụng cho các t...',
      code: '2025-2026.1.TIN4403.005',
      students: 52,
      colors: [Color(0xFF5B5B5B), Color(0xFF2E2F33)],
    ),
    Course(
      title: 'Lập trình ứng dụng cho các t...',
      code: '2025-2026.1.TIN4403.004',
      students: 50,
      colors: [Color(0xFF3B6CE1), Color(0xFF214AA8)],
    ),
    Course(
      title: 'Lập trình ứng dụng cho các t...',
      code: '2025-2026.1.TIN4403.003',
      students: 52,
      colors: [Color(0xFF2F3438), Color(0xFF4A4E54)],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: ListView.separated(
            itemCount: _courses.length,
            separatorBuilder: (_, __) => const SizedBox(height: 10),
            itemBuilder: (context, index) {
              final course = _courses[index];
              return CourseCard(course: course);
            },
          ),
        ),
      ),
    );
  }
}

// Mô hình dữ liệu đơn giản
class Course {
  final String title;
  final String code;
  final int students;
  final List<Color> colors;

  Course({
    required this.title,
    required this.code,
    required this.students,
    required this.colors,
  });
}

// Widget hiển thị 1 thẻ khoá học giống giao diện ảnh: gradient, text, menu
class CourseCard extends StatelessWidget {
  final Course course;

  const CourseCard({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Container(
        height: 140,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: course.colors,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Stack(
          children: [
            // Decorative shapes (bóng mờ giống background ảnh) — tuỳ biến
            Positioned(
              right: -30,
              top: -20,
              child: Transform.rotate(
                angle: -0.5,
                child: Opacity(
                  opacity: 0.12,
                  child: Container(
                    width: 220,
                    height: 120,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
            ),

            // Nội dung chính
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Hàng tiêu đề + menu ở phải
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          course.title,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      // 3-dot menu
                      PopupMenuButton<String>(
                        color: Colors.white,
                        icon: const Icon(
                          Icons.more_horiz,
                          color: Colors.white,
                        ),
                        onSelected: (value) {},
                        itemBuilder: (context) => [
                          const PopupMenuItem(
                              value: 'share', child: Text('Share')),
                          const PopupMenuItem(
                              value: 'details', child: Text('Details')),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: 8),

                  // code dưới tiêu đề
                  Text(
                    course.code,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.9),
                      fontSize: 14,
                    ),
                  ),

                  const Spacer(),

                  // Số học viên ở dưới cùng bên trái
                  Text(
                    '${course.students} học viên',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.9),
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
