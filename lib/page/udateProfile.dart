import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mainpage_detailuser_v1/View/main_screen.dart';
import 'package:mainpage_detailuser_v1/components/bodyWidgets/profileBody.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Udateprofile extends StatefulWidget {
  const Udateprofile({super.key});

  @override
  State<Udateprofile> createState() => _UdateprofileState();
}

class _UdateprofileState extends State<Udateprofile> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController newpasswordController = TextEditingController();
  final TextEditingController phonenumController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController dateBirthController = TextEditingController();
  String? id;
  String? username;
  String? pass;
  DateTime? selectedDate;

  @override
  void initState() {
    super.initState();
    _loadUserInfo();
  }
  

  Future<Map<String, dynamic>?> getUserInfoFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final String? userInfoString = prefs.getString('userInfo');

    if (userInfoString != null) {
      return json.decode(userInfoString) as Map<String, dynamic>;
    } else {
      return null;
    }
  }

  Future<void> _loadUserInfo() async {
    final prefs = await SharedPreferences.getInstance();
    final String? userInfoString = prefs.getString('userInfo');

    if (userInfoString != null) {
      final Map<String, dynamic> userInfo = json.decode(userInfoString);
      setState(() {
        id = userInfo['id'];
        username = userInfo['username'];
        phonenumController.text = userInfo['phonenum'] ?? '';
        addressController.text = userInfo['address'] ?? '';
        dateBirthController.text = userInfo['dateBirth'] ?? '';
        pass = userInfo['pass'];
      });
    }
  }

  bool checkOldPass(){
    if(passwordController.text == pass){
      return true;
    }
    return false;
  }

  Future<void> _updateUserProfile() async {
    if (id == null || username == null ) return;
    bool check = checkOldPass();
    if(check == true){
      final updatedUserInfo = {
      'id': id,
      'username': username,
      'pass': newpasswordController.text,  
      'phonenum': phonenumController.text,
      'address': addressController.text,
      'img': 'https://i.pinimg.com/564x/4e/22/be/4e22beef6d94640c45a1b15f4a158b23.jpg', 
      'dateBirth': dateBirthController.text,
    };

    // Update SharedPreferences
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('userInfo', json.encode(updatedUserInfo));

    // Update API
    final apiUrl = 'http://10.0.2.2:5125/api/User';
    try {
      final response = await http.put(
        Uri.parse('$apiUrl/${id}'), 
        headers: {'Content-Type': 'application/json'},
        body: json.encode(updatedUserInfo),
      );

      if (response.statusCode == 200) {
        print('User info updated successfully.');
        
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Thông tin đã được cập nhật')),
        );
       
      } else {
        print('Failed to update user info: ${response.statusCode}');
      }
    } catch (e) {
      print('Error updating user info: $e');
    }
    }
    else{
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Pass không đúng')),
      );
    }
    
  }


  // Hàm để mở DatePicker
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        dateBirthController.text = DateFormat('dd-MM-yyyy').format(picked); // Format date to YYYY-MM-DD
      });
    }
  }
  
  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // chuyen den trang moi
            Navigator.pop(context);

          },
        ),
        title: const Text(
          "Thay đổi thông tin",
          style: TextStyle(
            color: Colors.black,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: (){

            },
          ),
        ],

      ),
      body: SingleChildScrollView(
        
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 16),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  
                    Container(
                      width: 100,
                      height: 100,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(2),
                        child: Container(
                        width: 90,
                        height: 90,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Image.network(
                          'https://i.pinimg.com/564x/4e/22/be/4e22beef6d94640c45a1b15f4a158b23.jpg',
                          fit: BoxFit.fitWidth,
                        ),
                        ),
                      ),

                    ),
                  
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 16), 
              child: TextField(
                controller: newpasswordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Mật khẩu mới",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  

                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 16), 
              child: TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Mật khẩu cũ",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  

                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 16), 
              child: TextField(
                controller: phonenumController,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: "Số điện thoại",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 16), 
              child: TextField(
                controller: addressController,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: "Địa chỉ",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 16), 
              child: GestureDetector(
                onTap: () {
                  _selectDate(context);
                },
                child: AbsorbPointer(
                  child: TextField(
                    controller: dateBirthController,
                    decoration: InputDecoration(
                      hintText: "Date of Birth",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      suffixIcon: Icon(Icons.calendar_today),
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0, 0.05),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                child: ElevatedButton(
                  onPressed: () async {
                    // luu vao api
                    await _updateUserProfile();
                    
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Main_screen(title: '',)),
                    );
                    

                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 105, 163, 239),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  ),
                  child: const Text(
                    "Lưu thay đổi", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      
    );
  }
}