import 'package:flutter/material.dart';
import 'package:mainpage_detailuser_v1/components/app_bar.dart';
import 'package:mainpage_detailuser_v1/components/bottom_navigationbar.dart';
import 'package:mainpage_detailuser_v1/page/DangNhap.dart';

// ignore: camel_case_types
class Profile_screen extends StatefulWidget {
  const Profile_screen({super.key});

  @override
  State<Profile_screen> createState() => _Main_screenState();
}

// ignore: camel_case_types
class _Main_screenState extends State<Profile_screen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: const CustomAppBar(),
      body: body(),
      //bottomNavigationBar: const CustomBottomNavigationBar(),
      drawer: myDrawer(),
    );
  }

  Widget body() {
    return SafeArea(
      child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                child: ElevatedButton(
                  
                  child:  Text("Thanh Toán"),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(350, 40),
                    backgroundColor: Color(0xFF61ADF3),
                    padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
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


                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Dangnhap())
                    );
                  },
                ),
              ),
      
    );
  }

  Drawer myDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 0, 136, 255),
            ),
            child: Expanded(
              child: Row(
                children: [
                  const Icon(Icons.add),
                  ListTile(
                    title: const Text('Đoạn Chat'),
                    selected: _selectedIndex == 0,
                    onTap: () {
                      _onItemTapped(0);
                      Navigator.pop(context);
                    },
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void onClickButton() {}
}
