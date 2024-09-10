import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mainpage_detailuser_v1/page/DangNhap.dart';

class qmk extends StatefulWidget {
  @override
  _qmkState createState() => _qmkState();
}

class _qmkState extends State<qmk> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.all(24),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _header(context),
                _header2(context),
                _inputField(context),
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
          "Quên mật khẩu",
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
        SizedBox(height: 20,),
        Text(
          "Đặt lại mật khẩu",
          style: TextStyle(
            fontFamily: 'Inria Sans',
            fontWeight: FontWeight.w500,
            fontSize: 30,
            color: Color(0xFF000000),
          ),
        ),
        SizedBox(height: 30,),
        Text("Đặt mật khẩu dễ hơn để kết nối vào tài khoản của bạn!",
          style: TextStyle(
            fontFamily:'Noto Sans Thai UI',
            fontWeight: FontWeight.w700,
            fontSize: 22,
            color: Color(0xB2000000),
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
          "Email",
          style: TextStyle(
            fontFamily: 'Noto Sans Kannada',
            fontWeight: FontWeight.w700,
            fontSize: 20,
            color: Color(0x99000000),
          ),
        ),
        TextField(
          controller: _emailController,
          decoration: InputDecoration(
            hintText: "Nhập email",
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
          "Mật khẩu mới",
          style: TextStyle(
            fontFamily: 'Noto Sans Kannada',
            fontWeight: FontWeight.w700,
            fontSize: 20,
            color: Color(0x99000000),
          ),
        ),
        TextField(
          controller: _newPasswordController,
          decoration: InputDecoration(
            hintText: "Nhập mật khẩu mới",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide.none,
            ),
            fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
            filled: true,
            prefixIcon: Icon(Icons.password),
          ),
        ),
        SizedBox(height: 40),
        Center(
          child: ElevatedButton(
            onPressed: () {
              // Thực hiện đặt lại mật khẩu ở đây, ví dụ:
              // String email = _emailController.text;
              // String newPassword = _newPasswordController.text;

              // Thực hiện cập nhật mật khẩu qua API hoặc dịch vụ

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Dangnhap()),
              );
            },
            child: Text(
              "Hoàn tất",
              style: TextStyle(
                fontSize: 30,
                color: Color(0xff000000),
              ),
            ),
            style: OutlinedButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 133, 201, 234), // Màu nền
              minimumSize: Size(200, 60),
            ),
          ),
        )
      ],
    );
  }
}
