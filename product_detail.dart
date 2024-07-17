import 'package:flutter/material.dart';

class ProductDetailPage extends StatefulWidget {
  final String productName;
  final String productDescription;
  final List<String> productImages;

  const ProductDetailPage({
    Key? key,
    required this.productName,
    required this.productDescription,
    required this.productImages,
  }) : super(key: key);

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  bool isFavorite = false; // Biến trạng thái yêu thích
  int currentImageIndex = 0; // Chỉ số của hình ảnh hiện tại

  void _nextImage() {
    setState(() {
      currentImageIndex = (currentImageIndex + 1) % widget.productImages.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sản phẩm', style: TextStyle(fontSize: 22)),
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
                    Image.asset( 
                      widget.productImages[currentImageIndex],
                      width: double.infinity,
                      height: 410,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(height: 10),
                    // Sau phần hiển thị ảnh sản phẩm
                    SizedBox(height: 0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 30, // Đường kính của hình tròn
                          backgroundColor: const Color.fromARGB(255, 236, 232, 232), // Màu nền của hình tròn
                          child: IconButton(
                            icon: Icon(Icons.arrow_forward, color: Colors.black, size: 30), // Màu và kích thước của mũi tên
                            onPressed: _nextImage, // Chuyển đến hình ảnh tiếp theo
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 0), // Để tạo khoảng cách giữa ảnh và icon
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 24.0,
                        ),
                        SizedBox(width: 8), // Để tạo khoảng cách giữa icon và text
                        Text(
                          'Đánh giá: 4.5',
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(width: 100),
                        IconButton(
                          icon: Icon(
                            isFavorite ? Icons.favorite : Icons.favorite_border,
                            color: isFavorite ? Colors.red : Colors.grey,
                            size: 24.0,
                          ),
                          onPressed: () {
                            setState(() {
                              isFavorite = !isFavorite; // Thay đổi trạng thái yêu thích
                            });
                          },
                        ),
                        SizedBox(width: 0),
                        Text(
                          'Yêu thích',
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    Text(' Air Max LN',
                      style: const TextStyle(color: Colors.blue, fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      'Hãng: NIKE',
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 30),
                    Text(
                      'Chất liệu: Nhựa siêu nhẹ',
                      style: const TextStyle(color: Colors.blue, fontSize: 20, fontWeight: FontWeight.normal),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Đế lót: Siêu nhẹ',
                      style: const TextStyle(color: Colors.blue, fontSize: 20, fontWeight: FontWeight.normal),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Kiểu dáng: Thể thao',
                      style: const TextStyle(color: Colors.blue, fontSize: 20, fontWeight: FontWeight.normal),
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
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.shopping_bag, color: Colors.white, size: 27),
                              SizedBox(height: 10),
                              Text(
                                '4.500.000', // Thay đổi thành giá tiền thực tế của sản phẩm
                                style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
                              ),
                              
                            ],
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                        'Mô tả chi tiết sản phẩm',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      ]
                    ),
                    SizedBox(height: 10),
                    Text(
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
