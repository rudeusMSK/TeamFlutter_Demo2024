import 'package:flutter/material.dart';
import 'package:mainpage_detailuser_v1/page/DangNhap.dart';
import 'package:shared_preferences/shared_preferences.dart';

 Widget profilebody(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          child: ElevatedButton(
            child: Text("Đăng xuất"),
            style: ElevatedButton.styleFrom(
              minimumSize: Size(200, 50), // Chiều rộng và chiều cao cố định
              backgroundColor: Color(0xFF61ADF3),
              padding: EdgeInsets.symmetric(vertical: 15),
              elevation: 3,
              foregroundColor: Colors.white,
              textStyle: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
            ),
            onPressed: ()async {
              await logout();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Dangnhap()),
              );
            },
          ),
        ),
      ),
    );
}

Future<void> logout() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.remove('userInfo');
  print("Xoa thanh cong");
}