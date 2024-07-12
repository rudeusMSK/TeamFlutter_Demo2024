import 'package:flutter/material.dart';
import 'package:mainpage_detailuser_v1/Model/Fake_Category.dart';
import 'package:mainpage_detailuser_v1/Model/Product.dart';
import 'package:mainpage_detailuser_v1/ViewModel/product_view_Model.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class HomeBody extends StatefulWidget {
  late Product? product;

  HomeBody({super.key, this.product});

  @override
  // ignore: library_private_types_in_public_api
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  static const String iconAddress = "lib/public/icons/category/";

  //
  ProductViewModel productViewModel = ProductViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    productViewModel.fetchProductList();
  }

  // select item: (default)
  int selectedCategortItem = 0;
  int selectProductItem = 0;
  //demo:
  int price = 10;
  String unit = '\$';

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
        Expanded(child: ChangeNotifierProvider(
          create: (context) => productViewModel,
        child: productListView(),
        )
      ),
      ],
    );
  }

  /*
      widgets:
 */

// Title:
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
              'èn choai nêu prồ đúch',
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
  Widget productListView() {
    return Consumer<ProductViewModel>(
      builder: (context, viewModel, child) {
        // => chưa có repon từ endpoit >>> loading.gif
        if (viewModel.products.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        } 
        // show product info:
        else {
          return GridView.builder( // update: GridView.Count => GridView.builder
            // Use: (hướng dẫn sử zụn)
            itemCount: viewModel.products.length, // số lượng items
            // build gird: items positions
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // col (2 cột như trên figma nhóa !)
              childAspectRatio: 4 / 5, // chiều rộng dài của mỗi item (để đại i, theo ông bà mách bảo :3 !!)
            ),
            itemBuilder: (context, index) {
              // Get: product
              final product = viewModel.products[index];
              return Card(
                child: Column(
                  children: [
                    Image.asset(
                    // todo: update backend -> link hình sản phẩm !
                      category[1]
                          .logo
                          .toString(),
                      width: 60,
                      height: 60,
                    ),
                    // todo: update backend -> link hình sản phẩm !
                    Text(
                      product.tenSP ?? "",
                      style:
                          const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Giá $price $unit',  // todo: update backend -> Giá sản phẩm!
                    ),
                  ],
                ),
              );
            },
          );
        }
      },
    );
  }
}
