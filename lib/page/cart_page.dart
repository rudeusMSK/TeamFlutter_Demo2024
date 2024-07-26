import 'package:flutter/material.dart';
import 'package:mainpage_detailuser_v1/Model/Cart.dart';
import 'package:mainpage_detailuser_v1/page/checkout.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<Cartprovider>(context);
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text('Giỏ hàng'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // Navigate to the search page
            },
          ),
        ],
      ),
      bottomNavigationBar: checkoutBottomNavbar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),
            const Text(
              "Giỏ hàng của bạn",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const Text(
              "Sản phẩm",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            Flexible(
              flex: 1,
              child: cartProvider.items.isEmpty?
              Center(child: Text("Gio hang trong"),):
              ListView.builder(
                shrinkWrap: true,
                itemCount: cartProvider.items.length,
                itemBuilder: (context, index) {
                  final item = cartProvider.items[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: Row(
                      children: [
                       
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Transform.rotate(
                            angle: 10 *
                                (3.14 / 180.0), // Convert degrees to radians
                            child: Image.network(
                              item.imageUrl,
                              width: 130,
                              height: 130,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(item.name,
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold)),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(item.price + " d",
                                  style: TextStyle(fontSize: 16)),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  InkWell(
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.grey[200],
                                          border:
                                              Border.all(color: Colors.black),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: const Icon(
                                        Icons.remove,
                                        size: 18.0,
                                      ),
                                    ),
                                    onTap: () {
                                      // xoa
                                      //cartProvider.addItem(item);  
                                      cartProvider.decreaseQuantity(item.id);                                  
                                    },
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0),
                                    child:  Text(
                                      item.quantity.toString(),
                                    ),
                                  ),
                                  InkWell(
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.grey[200],
                                          border:
                                              Border.all(color: Colors.black),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: const Icon(
                                        Icons.add,
                                        size: 18.0,
                                      ),
                                    ),
                                    onTap: () {
                                      setState(() {
                                        cartProvider.increaseQuantity(item.id);
                                        //cartProvider.addItem(item);
                                      });
                                    },
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        Container(
                            height: 50,
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(10)),
                            child: IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () {
                                cartProvider.removeItem(item.id);
                              },
                            ))
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  checkoutBottomNavbar() {
    final cartProvider= Provider.of<Cartprovider>(context);
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: Container(
        height: 150,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Tổng Tiền",
                  ),
                  GestureDetector(
                    child:  Text(
                      "${cartProvider.TotalPrice} d",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    onTap: () {
                      Navigator.of(context).pushNamed("/payments");
                    },
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              // add icon checkout
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff61ADF3),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => checkout(
                        cartItems: cartProvider.items.map((item) =>{
                          'id' : item.id,
                          'quantity' : item.quantity,
                          'totalPrice' : item.totalPrice,
                        }).toList(),
                        totalPrice : cartProvider.TotalPrice,
                      )),
                      
                    );
                  },
                  child: const Text(
                    "Thanh Toán",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
