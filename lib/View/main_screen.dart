import 'package:flutter/material.dart';
import 'package:mainpage_detailuser_v1/components/app_bar.dart';
import 'package:mainpage_detailuser_v1/components/bottom_navigationbar.dart';
import 'package:mainpage_detailuser_v1/components/bodyWidgets/chatBody.dart';
import 'package:mainpage_detailuser_v1/components/bodyWidgets/editBody.dart';
import 'package:mainpage_detailuser_v1/components/bodyWidgets/homeBody.dart';
import 'package:mainpage_detailuser_v1/components/bodyWidgets/loveBody.dart';
import 'package:mainpage_detailuser_v1/components/bodyWidgets/profileBody.dart';
import 'package:mainpage_detailuser_v1/components/bodyWidgets/Errorbody.dart';

import 'package:mainpage_detailuser_v1/Model/Fake_User.dart';

// ignore: camel_case_types
class Main_screen extends StatefulWidget {
  // Attribute:
  final String title;

  // constructor:
  const Main_screen({super.key, required this.title});

  @override
  State<Main_screen> createState() => _Main_screenState();
}

// ignore: camel_case_types
class _Main_screenState extends State<Main_screen> {
  
  User user = User(18, '🐸');

  // Attribute:
  int _selectedIndex = 0; // default: home body.

  final PageController _pageController = PageController();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.jumpToPage(index);
  }

  @override
  void initState() {
    super.initState();
    print("user.name.length: ${user.name.length}");
  }

  @override
  Widget build(BuildContext context) {
    // TODO: Move bodyItem initialization here to ensure context is available
    List<Widget> bodyItem = [
      HomeBody(), // 0
      editbody(), // 1
      lovebody(), // 2
      chatbody(), // 3
      profilebody(), // 4
    ];

    return Scaffold(
      // appbar:
      appBar: const CustomAppBar(),
      // body:
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },

        // lỗi dữ liệu json j á => tính sau ฅ^•ﻌ•^ฅ
        // demo:
        // children: user.name.length != 2 ? bodyItem : [Errorbody(user)], // Errorbody(var)
        children: bodyFunction_(bodyItem),
      ),
      // CustomBottomNavigationBar(int, void(int))
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),

      // chưa dùng đến á.
      drawer: myDrawer(),
    );
  }

  /*
  * demo:
  * => lỗi j đó hoặc dữ liệu ko hợp lệ 🐸🐸
  * hoặc bình thường trả về danh sách widget body.
  */
  List<Widget> bodyFunction_(List<Widget> bodyItem) {
   return user.name != '🐸' 
    ? [Errorbody(user)] // Errorbody(var)
    : bodyItem; // 5
  }

  // chưa dùng đến á.
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
