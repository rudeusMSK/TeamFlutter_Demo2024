import 'package:flutter/material.dart';
import 'package:mainpage_detailuser_v1/Model/Cart.dart';
import 'package:mainpage_detailuser_v1/View/Main_screen.dart';
import 'package:mainpage_detailuser_v1/page/DangNhap.dart';
import 'package:mainpage_detailuser_v1/page/cart_page.dart';
import 'package:mainpage_detailuser_v1/page/checkout.dart';
import 'package:mainpage_detailuser_v1/page/dk.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => Cartprovider(),
      child: MyApp(),
    ),
  );
}

// MyApp:
class MyApp extends StatelessWidget {
  
  // constructor:
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cửa Hàng Bán Đồ Thể Thao',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  Dangnhap(),
      
    );
  }
}