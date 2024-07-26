// ignore_for_file: library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:mainpage_detailuser_v1/Model/ApiService.dart';
import 'package:mainpage_detailuser_v1/Model/Fake_Category.dart';
import 'package:mainpage_detailuser_v1/Model/Product.dart';
import 'package:mainpage_detailuser_v1/page/ProductDetails_screen.dart';
import 'product_view_Model.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class HomeBody extends StatefulWidget {
  //late Product? product;

  HomeBody({super.key});

  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  static const String iconAddress = "lib/public/icons/category/";

  //
  //ProductViewModel productViewModel = ProductViewModel();
  late Future<List<Product>> _products;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //productViewModel.fetchProducts();
    _products =ApiService().getProduct();
  }

  // select item: (default)
  int selectedCategortItem = 0;
  int selectProductItem = 0;
  //demo:
  int price = 10;
  String unit = 'Đ';

  /* ****************************************** Start ******************************************

    - ฅ^•ﻌ•^ฅ demo only!:
                  xóa khi đã có backend ! 😺😺😺

     ****************************************** Start ****************************************** */
/*
  TODO: Class zí zụ làm mòe nhớ xóa nhoaa !
*/
  final List<Category> category = [
    // Category(id, Name, location + Logo) - ฅ^•ﻌ•^ฅ
    Category(1, "All", "${iconAddress}All.png"),
    Category(2, "Adidas", "${iconAddress}Adidas.png"),
    Category(3, "Fila", "${iconAddress}Fila.png"),
    Category(4, "Nike", "${iconAddress}Nike.png"),
    Category(5, "Puma", "${iconAddress}Puna.png"),
  ];

  // final List<String> Urls = [
  //   // Category(id, Name, location + Logo) - ฅ^•ﻌ•^ฅ
  //   "Hình 1",
  //   "Hình 2",
  //   "Hình 3"
  // ];
  /* ****************************************** END ******************************************

    - ฅ^•ﻌ•^ฅ demo only!:
                  xóa khi đã có backend ! 😺😺😺

     ****************************************** END ****************************************** */

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        productTitle(),
        categoryListView(),
        Expanded(
          child: FutureBuilder<List<Product>>(
            future: _products,
            builder: (context, snapshot){
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(child: Text('No products available'));
              } else {
                return productListView(snapshot.data!);
              }
            },
          
        )),
      ],
    );
  }

/*
      ****************** widgets start ******************
*/

// Title page:
  Widget productTitle() {
    String selectedCategory = 'Sản phẩm'; // default

    if (selectedCategortItem >= 0 && selectedCategortItem < category.length) {
      selectedCategory = category[selectedCategortItem].name.toString();
    }

    return Container(
      margin: const EdgeInsets.only(top: 20, left: 5, right: 5, bottom: 0),
      padding: const EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Align(
            alignment: Alignment.topLeft,
            child: Text(
              'Sản phẩm mới',
              style: TextStyle(
                color: Color(0xFF152354),
                fontSize: 30,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              selectedCategory, // Hiển thị nội dung đã thay đổi dựa trên icon được chọn
              style: const TextStyle(
                color: Color(0xFF152354),
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.left,
            ),
          ),
        ],
      ),
    );
  }

// Category Items:
  Widget categoryListView() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 2),
      height: 80,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: category.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedCategortItem = index;
              });
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Animation transfer delay: 0,5s -⁠ ฅ^•ﻌ•^ฅ
                AnimatedContainer(
                  duration: const Duration(
                      milliseconds: 200), // Recommended:  0,3 - 0,5

                  padding: const EdgeInsets.all(5),
                  margin: const EdgeInsets.all(2),

                  width: 100,
                  height: 100,

                  decoration: BoxDecoration(
                    color: selectedCategortItem == index
                        ? const Color(0xFF69BDFC)
                        : const Color(0xFFD9D9D9),
                    shape: BoxShape.circle,
                  ),

                  child: Center(
                    child: Image.asset(
                      category[index].logo,
                      width: 60,
                      height: 60,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

// Products Items:
  Widget productListView(List<Product> products) {
    return GridView.builder(
      itemCount: products.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 5 / 5,  ),
      itemBuilder: (context, index){
        final product = products[index];
        final String? firstImageUrl = product.img != null && product.img!.isNotEmpty
                ? product.img![0]
                : null;   
        return GestureDetector(
          onTap: (){
            final List<String> urls = product.img!;
            Navigator.push(
              context, 
              MaterialPageRoute(
                builder: (context) => ProductDetailPage(
                  key: ValueKey('product_detail_page_$index'),
                  productName: product.name.toString(),
                  productDescription: product.description.toString(),
                  productImages: urls,
                  ProductId: product.id.toString(),
                  productPrice: product.price.toString(),
                  productLoaisp: product.loaisp.toString(),
                  productSize: product.size.toString(),
                ),
              ),
            );
            
          },
          child: Card(
            child: Column(
              children: [
                firstImageUrl != null
                    ? Image.network(
                        firstImageUrl,
                        width: 120,
                        height: 120,
                        errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
                          print('Error loading image: $error'); // Debugging line
                          return const Center(child: Icon(Icons.error));
                        },
                      )
                    : const Text(
                        "Sp không có hình ",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                Text(
                  product.name ?? "",
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Giá: ${product.price} $unit',
                ),                
              ],
            ),
          ),
        );
      },

    );
    
  }

/*
      ****************** widgets end ******************
*/
}
