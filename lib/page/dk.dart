import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mainpage_detailuser_v1/page/DangNhap.dart';
import 'package:http/http.dart' as http;


class Dk extends StatefulWidget {
  @override
  _DkState createState() => _DkState();
}

class _DkState extends State<Dk> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _phoneNumController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _errorMessage = "";

  Future<bool> isUsernameTaken(String username) async {
    List<Map<String, dynamic>> users = await fetchUsers();

    for (var user in users) {
      if (user['username'] == username) {
        return true;
      }
    }
    return false;
  }

  Future<bool> registerUser(String username, String password, String phonenum) async {
    final String apiUrl = 'http://10.0.2.2:5125/api/User/';
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'id': "",
        'username': username,
        'pass': password,
        'phonenum':  phonenum,
        'address': "",
        'img': "",
        'dateBirth': "",
      }),
    );

    if (response.statusCode == 201) {
      return true;
    } else {
      print("Failed to register user. Status Code: ${response.statusCode}");
      print("Response Body: ${response.body}");
      return false;
    }
  }


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
                _registerButton(context),
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
          controller: _usernameController,
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
          "Số điện thoại",
          style: TextStyle(
            fontFamily: 'Noto Sans Kannada',
            fontWeight: FontWeight.w700,
            fontSize: 20,
            color: Color(0x99000000),
          ),
        ),
        TextField(
          controller: _phoneNumController,
          decoration: InputDecoration(
            hintText: "Nhập Số Điện Thoại",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide.none,
            ),
            fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
            filled: true,
            prefixIcon: Icon(Icons.phone),
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

  _registerButton(context) {
    return Center(
      child: ElevatedButton(
        onPressed: () async {
          String username = _usernameController.text;
          String phonenum = _phoneNumController.text;
          String password = _passwordController.text;

          // Giả sử bạn gọi một API để đăng ký người dùng
          if (await isUsernameTaken(username)) {
            setState(() {
              _errorMessage = "Tên đăng nhập đã tồn tại!";
            });
            return;
          }

          bool success = await registerUser(username, password, phonenum);
          if (success) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Dangnhap()),
            );
          } else {
            setState(() {
              _errorMessage = "Đăng ký thất bại!";
            });
          }
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
          minimumSize: Size(200, 60),
        ),
      ),
    );
  }

  
}
