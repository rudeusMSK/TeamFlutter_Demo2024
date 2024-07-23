import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mainpage_detailuser_v1/page/dk.dart';
import 'package:mainpage_detailuser_v1/page/qmk.dart';
import 'package:mainpage_detailuser_v1/View/main_screen.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


class Dangnhap extends StatefulWidget {
  @override
  _DangnhapState createState() => _DangnhapState();
}

class _DangnhapState extends State<Dangnhap> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _errorMessage = "";

  Future<bool> authenticateUser(String username, String password) async {
    List<Map<String, dynamic>> users = await fetchUsers();

    for (var user in users) {
      if (user['username'] == username && user['pass'] == password) {
        await saveUserInfoToPrefs(user);
        return true;
      }
    }
    return false;
  }

  Future<void> saveUserInfoToPrefs(Map<String, dynamic> userInfo) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('userInfo', json.encode(userInfo));
    print("Luu vao share pref thanh cong");
  }//ham de luu thong tin nguoi dung vao bo nho may de su dung cho chuc nang khac ten la userInfo


  Future<List<Map<String, dynamic>>> fetchUsers() async {
  final String apiUrl = 'http://10.0.2.2:5125/api/User/';

  try {
    final response = await http.get(Uri.parse(apiUrl), headers: {'Content-Type': 'application/json'});

    print("Response status: ${response.statusCode}");
    print("Response body: ${response.body}");

    if (response.statusCode == 200) {
      List<dynamic> responseBody = json.decode(response.body);
      return responseBody.cast<Map<String, dynamic>>();
    } else {
      print("Server error: ${response.statusCode}");
      return [];
    }
  } catch (e) {
    print("Connection error: $e");
    return [];
  }
  }
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
                if (_errorMessage.isNotEmpty) ...[
                  SizedBox(height: 20),
                  Text(
                    _errorMessage,
                    style: TextStyle(color: Colors.red, fontSize: 16),
                  ),
                ],
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
          "Đăng Nhập",
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
          "Chào mừng quay trở lại!!!",
          style: TextStyle(
            fontFamily: 'Inria Sans',
            fontWeight: FontWeight.w500,
            fontSize: 30,
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
          controller: _usernameController,
          decoration: InputDecoration(
            hintText: "Nhập tên đăng nhập",
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
          "Mật khẩu",
          style: TextStyle(
            fontFamily: 'Noto Sans Kannada',
            fontWeight: FontWeight.w700,
            fontSize: 20,
            color: Color(0x99000000),
          ),
        ),
        TextField(
          controller: _passwordController,
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
      ],
    );
  }

  _login(context) {
    return Column(
      children: [
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
              onPressed: () async {
                String username = _usernameController.text;
                String password = _passwordController.text;
            
                // Giả sử bạn gọi một API để xác thực người dùng
                bool loginSuccess = await authenticateUser(username, password);
                
                if (loginSuccess) {
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Main_screen(title: '',)),
                );
                } else {
                  setState(() {
                    _errorMessage = "Tên đăng nhập hoặc mật khẩu không đúng!";
                  });
                }
              },
              child: Text(
                "Đăng nhập",
                style: TextStyle(
                  fontSize: 20,
                  color: Color(0xff000000),
                ),
              ),
              style: OutlinedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 133, 201, 234), // Màu nền
                minimumSize: Size(150, 60),
              ),
              ),
              SizedBox(width: 10),
              ElevatedButton(
              onPressed: () async {
                
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Dk()),
                );
                
              },
              child: Text(
                "Đăng ký",
                style: TextStyle(
                  fontSize: 20,
                  color: Color(0xff000000),
                ),
              ),
              style: OutlinedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 133, 201, 234), // Màu nền
                minimumSize: Size(150, 60),
              ),
              ),
            ]
            
          ),
          
        ),
        SizedBox(height: 20),
        Text("Quên mật khẩu?"),
        TextButton(
          onPressed: () {
            Navigator.push(
              context, 
              MaterialPageRoute(builder: (context) => qmk()),
            );
          },
          child: Text("Nhập email"),
        ),
      ],
    );
  }

}
