import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mainpage_detailuser_v1/DK,DN/DangNhap.dart';

class Dk extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.all(24),
          child: SingleChildScrollView( // Thêm SingleChildScrollView
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _header(context),
                _header2(context),
                _inputField(context),
                _login(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _header(context) {
    return Column(
      children: [
        Text(
          "Đăng Ký",
          style: TextStyle(
            fontFamily: 'Inria Sans',
            fontWeight: FontWeight.w700,
            fontSize: 30,
            color: Color(0xFF000000),
          ),
        ),
      ],
    );
  }

  _header2(context) {
    return Column(
      children: [
        Text(
          "Tạo tài khoản",
          style: TextStyle(
            fontFamily: 'Inria Sans',
            fontWeight: FontWeight.w700,
            fontSize: 35,
            color: Color(0xFF000000),
          ),
        ),
      ],
    );
  }

  _inputField(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20),
        Text(
          "Tên đăng nhập",
          style: TextStyle(
            fontFamily: 'Noto Sans Kannada',
            fontWeight: FontWeight.w700,
            fontSize: 20,
            color: Color(0x99000000),
          ),
        ),
        TextField(
          decoration: InputDecoration(
            hintText: "Nhập tên tài khoản",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide.none,
            ),
            fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
            filled: true,
            prefixIcon: Icon(Icons.person),
          ),
        ),
        SizedBox(height: 20),
        Text(
          "Email",
          style: TextStyle(
            fontFamily: 'Noto Sans Kannada',
            fontWeight: FontWeight.w700,
            fontSize: 20,
            color: Color(0x99000000),
          ),
        ),
        TextField(
          decoration: InputDecoration(
            hintText: "Nhập Email",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide.none,
            ),
            fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
            filled: true,
            prefixIcon: Icon(Icons.email),
          ),
        ),
        SizedBox(height: 20),
        Text(
          "Mật khẩu",
          style: TextStyle(
            fontFamily: 'Noto Sans Kannada',
            fontWeight: FontWeight.w700,
            fontSize: 20,
            color: Color(0x99000000),
          ),
        ),
        TextField(
          decoration: InputDecoration(
            hintText: "Nhập mật khẩu",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide.none,
            ),
            fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
            filled: true,
            prefixIcon: Icon(Icons.password),
          ),
          obscureText: true,
        ),
        SizedBox(height: 40),
        Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(context, 
                            MaterialPageRoute(builder: (context) => Dangnhap()),

              );
            },
            child: Text(
              "Đăng Ký",
              style: TextStyle(
                fontSize: 30,
                color: Color(0xff000000),
              ),
            ),
            style: OutlinedButton.styleFrom(
    backgroundColor: Color.fromARGB(255, 133, 201, 234), // Màu nền
    //side: BorderSide(color: Colors.black, width: 1),
    minimumSize: Size(200, 60), 
          ),
        ),)
      ],
    );
  }

  _login(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Đã có tài khoản? "),
        TextButton(
          onPressed: () {
            Navigator.push(context,
            MaterialPageRoute(builder: (context)=>Dangnhap())
            );
          },
          child: Text("Đăng nhập"),
        ),
      ],
    );
  }
}
