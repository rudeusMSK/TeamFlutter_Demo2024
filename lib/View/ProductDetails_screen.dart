// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class ProductDetailPage extends StatefulWidget {
  final String productName;
  final String productDescription;
  final List<String> productImages;
  final String ProductDetail;

  const ProductDetailPage(
      {super.key,
      required this.productName,
      required this.productDescription,
      required this.productImages,
      required this.ProductDetail});

  @override
  // ignore: library_private_types_in_public_api
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  bool isFavorite = false;
  int currentImageIndex = 0;

  void _nextImage() {
    setState(() {
      currentImageIndex = (currentImageIndex + 1) % widget.productImages.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sản phẩm', style: TextStyle(fontSize: 22)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(
                      widget.productImages[currentImageIndex],
                      width: double.infinity,
                      height: 240,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(height: 10),
                    // Sau phần hiển thị ảnh sản phẩm
                    const SizedBox(height: 0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 30, // Đường kính của hình tròn
                          backgroundColor: const Color.fromARGB(
                              255, 236, 232, 232), // Màu nền của hình tròn
                          child: IconButton(
                            icon: const Icon(Icons.arrow_forward,
                                color: Colors.black,
                                size: 30), // Màu và kích thước của mũi tên
                            onPressed:
                                _nextImage, // Chuyển đến hình ảnh tiếp theo
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                        height: 0), // Để tạo khoảng cách giữa ảnh và icon
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 24.0,
                        ),
                        const SizedBox(
                            width: 8), // Để tạo khoảng cách giữa icon và text
                        const Text(
                          'Đánh giá: 4.5',
                          style: TextStyle(fontSize: 20),
                        ),
                        const SizedBox(width: 100),
                        IconButton(
                          icon: Icon(
                            isFavorite ? Icons.favorite : Icons.favorite_border,
                            color: isFavorite ? Colors.red : Colors.grey,
                            size: 24.0,
                          ),
                          onPressed: () {
                            setState(() {
                              isFavorite =
                                  !isFavorite; // Thay đổi trạng thái yêu thích
                            });
                          },
                        ),
                        const SizedBox(width: 0),
                        const Text(
                          'Yêu thích',
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    Text(
                      ' test: id sản phẩm ${widget.ProductDetail} ',
                      style: const TextStyle(
                          color: Colors.blue,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      'Hãng: NIKE',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 30),
                    const Text(
                      'Chất liệu: Nhựa siêu nhẹ',
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 20,
                          fontWeight: FontWeight.normal),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Đế lót: Siêu nhẹ',
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 20,
                          fontWeight: FontWeight.normal),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Kiểu dáng: Thể thao',
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 20,
                          fontWeight: FontWeight.normal),
                    ),
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 100.0),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.shopping_bag,
                                  color: Colors.white, size: 27),
                              SizedBox(height: 10),
                              Text(
                                '4.500.000', // Thay đổi thành giá tiền thực tế của sản phẩm
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Mô tả chi tiết sản phẩm',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ]),
                    const SizedBox(height: 10),
                    const Text(
                      'Hệ thống Dynamic Air của chúng tôi có 2 bộ ống áp suất kép. Với lượng áp lực chắc nhất ở gót chân và lượng áp lực mềm nhất về phía giữa bàn chân, mức không khí thay đổi trong mỗi bộ để chuyển tiếp mượt mà khi bạn bước đi. Lớp lưới nhiều lớp ở phần trên tạo cảm giác nhẹ và thoáng khí, với họa tiết haptic tạo nên vẻ ngoài có kết cấu. Lớp bọt xốp bao quanh hệ thống đệm tạo cảm giác nâng cao, mềm mại và hỗ trợ độc đáo. Mang lại sự thoải mái từ trên xuống dưới, thiết kế xúc giác này tự hào có độ nảy ở mức hiệu suất để tiếp thêm năng lượng cho mọi chuyển động của bạn.',
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
