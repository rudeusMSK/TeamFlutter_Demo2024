import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mainpage_detailuser_v1/page/DangNhap.dart';
import 'package:mainpage_detailuser_v1/page/dk.dart';
import 'package:mainpage_detailuser_v1/page/udateProfile.dart';
import 'package:shared_preferences/shared_preferences.dart';


Future<Map<String, dynamic>?> getUserInfoFromPrefs() async {
  final prefs = await SharedPreferences.getInstance();
  final String? userInfoString = prefs.getString('userInfo');

  if (userInfoString != null) {
    return json.decode(userInfoString) as Map<String, dynamic>;
  } else {
    return null;
  }
}




 Widget profilebody(BuildContext context) {
  //String? username = getNameUserFromPrefs() as String?;
  
    return SafeArea(
      top: true,
      child:  FutureBuilder<Map<String, dynamic>?>(
        future: getUserInfoFromPrefs(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data == null) {
            return Center(child: Text('No user info found.'));
          } else {
          final userinfo = snapshot.data!;
          final username = userinfo['username'] ?? 'No username';
          final address = userinfo['address'] ?? 'No address';
          final phoneNum = userinfo['phonenum'] ?? 'No phone number';
          final dateOfBirth = userinfo['dateBirth'] ?? 'No date of birth';
          final img = userinfo['img'] ?? 'No img';
          return Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              const SizedBox(height: 20,),
              Card(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                color: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Padding(
                  padding: EdgeInsets.all(2),
                  child: ClipRRect(
                  borderRadius: BorderRadius.circular(60),
                  child: Image.network(
                      img,
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                    child: Text(
                      username,
                      style: const TextStyle(
                        fontFamily: 'Outfit',
                        letterSpacing: 0,
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
              const Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                child: Text(
                  '',
                  style: TextStyle(
                            fontFamily: 'Readex Pro',
                            color: Colors.black,
                            letterSpacing: 0,
                  ),
                ),
              ),
              const Divider(
                height: 44,
                thickness: 1,
                indent: 24,
                endIndent: 24,
                color: Colors.black,
              ),

              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                    child: Text(
                      'Địa chỉ',
                      style: TextStyle(
                            fontFamily: 'Readex Pro',
                            fontSize: 18,
                            letterSpacing: 0,
                          ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                    child: Text(
                      address,
                      style: TextStyle(
                            fontFamily: 'Readex Pro',
                            fontSize: 18,
                            letterSpacing: 0,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                ],
              ),

              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                    child: Text(
                      'Số điện thoại',
                      style: TextStyle(
                            fontFamily: 'Readex Pro',
                            fontSize: 18,
                            letterSpacing: 0,
                          ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                    child: Text(
                      phoneNum,
                      style: TextStyle(
                            fontFamily: 'Readex Pro',
                            fontSize: 18,
                            letterSpacing: 0,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                ],
              ),

              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                    child: Text(
                      'Ngày sinh',
                      style: TextStyle(
                            fontFamily: 'Readex Pro',
                            fontSize: 18,
                            letterSpacing: 0,
                          ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                    child: Text(
                      dateOfBirth,
                      style: TextStyle(
                            fontFamily: 'Readex Pro',
                            fontSize: 18,
                            letterSpacing: 0,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                ],
              ),

              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Udateprofile())
                  );
                },
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: Colors.black,
                            width: 2,
                      ),
                    ),
                    child:const Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(8, 12, 8, 12),
                      child: Row(
                        mainAxisSize:MainAxisSize.max ,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                            child: Icon(
                                  Icons.account_circle_outlined,
                                  color: Colors.black,
                                  size: 24,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                            child: Text(
                              'Chỉnh sửa thông tin cá nhân',
                              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
          
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                child: ElevatedButton(
                  onPressed: () {
                    // log out
                    logout();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Dangnhap())
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFF1F4F8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  ),
                  child: const Text(
                    "Đăng xuất", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          );
        }
 }),
    );
}

Future<void> logout() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.remove('userInfo');
  print("Xoa thanh cong");
}