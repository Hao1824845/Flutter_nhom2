import 'package:flutter/material.dart';
import 'package:flutter_nhom2/API.dart';
import 'package:flutter_nhom2/product.dart';

class MyProduct extends StatefulWidget {
  const MyProduct({super.key});

  @override
  State<MyProduct> createState() => _MyProductState();
}

class _MyProductState extends State<MyProduct> {
  // Biến để lưu trữ Future, tránh việc gọi API nhiều lần
  late Future<List<Product>> _productsFuture;

  @override
  void initState() {
    super.initState();
    // Khởi tạo Future chỉ 1 lần
    _productsFuture = testApi.getAllProduct();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Danh Sách Sản Phẩm'),
        backgroundColor: Colors.blueGrey,
      ),
      body: FutureBuilder<List<Product>>(
        future: _productsFuture,
        builder: (context, snap) {
          if (snap.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snap.hasError) {
            return Center(child: Text('Đã xảy ra lỗi: ${snap.error}'));
          }

          if (snap.hasData && snap.data!.isNotEmpty) {
            return mylistview(snap.data!);
          }

          return const Center(child: Text('Không tìm thấy sản phẩm nào.'));
        },
      ),
    );
  }

  Widget mylistview(List<Product> ls) {
    return ListView(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
      children: ls.map((p) => myItem(p)).toList(),
    );
  }

  Widget myItem(Product p) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: ListTile(
          leading: SizedBox(
            width: 70,
            height: 70,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                p.image,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes!
                          : null,
                    ),
                  );
                },
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(
                    Icons.image_not_supported,
                    size: 40,
                    color: Colors.grey,
                  );
                },
              ),
            ),
          ),
          title: Text(
            p.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          subtitle: Text(
            '\$${p.price.toStringAsFixed(2)}',
            style: const TextStyle(
              color: Colors.red,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          trailing: const Icon(
            Icons.arrow_forward_ios,
            size: 16,
            color: Colors.grey,
          ),
          contentPadding: const EdgeInsets.all(10.0),
        ),
      ),
    );
  }
}
