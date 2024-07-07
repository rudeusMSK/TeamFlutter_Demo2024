import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mainpage_detailuser_v1/DK,DN/DangNhap.dart';
import 'package:mainpage_detailuser_v1/DK,DN/dk.dart';

class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.all(45),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _header(context),
                _signup(context),
                _login(context)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _header(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "YOURSPORT",
          style: TextStyle(
            fontFamily: 'Inter',
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w900,
            fontSize: 48,
            color: Color(0xFF79C2D9),
          ),
        ),
        SizedBox(height: 20),
        Text(
          "Discover all your trendy sport",
          style: TextStyle(
            fontFamily: "Inter",
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w500,
            fontSize: 24,
            color: Color(0xff000000),
          ),
        ),
      ],
    );
  }

 _signup(context) {
  return Column(
    children: [
      SizedBox(height: 120),
     OutlinedButton(
  onPressed: () {
     Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Dk()),
            );
  },
  child: Text(
    "Đăng Ký",
    style: TextStyle(
      fontSize: 30,
      color: Colors.black, // Màu chữ
    ),
  ),
  style: OutlinedButton.styleFrom(
    backgroundColor: Color.fromARGB(255, 133, 201, 234), // Màu nền
    //side: BorderSide(color: Colors.black, width: 1),
    minimumSize: Size(200, 60), 
  ),
)

    ],
  );
}

_login(context) {
  return Column(
    children: [
      SizedBox(height: 20),
     OutlinedButton(
  onPressed: () {
    Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Dangnhap()),
            );
  },
  child: Text(
    "Đăng Nhập",
    style: TextStyle(
      fontSize: 30,
      color: Colors.black, // Màu chữ
    ),
  ),
  style: OutlinedButton.styleFrom(
    backgroundColor: Color.fromARGB(255, 133, 201, 234), // Màu nền
    //side: BorderSide(color: Colors.black, width: 1),
    minimumSize: Size(200, 60), 
  ),
)

    ],
  );
}

}
