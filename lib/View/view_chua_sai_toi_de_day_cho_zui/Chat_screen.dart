import 'package:flutter/material.dart';
// import 'package:mainpage_detailuser_v1/components/app_bar.dart';
// import 'package:mainpage_detailuser_v1/components/bottom_navigationbar.dart';

class Chat_screen extends StatefulWidget {
  const Chat_screen({super.key});

  @override
  State<Chat_screen> createState() => _Main_screenState();
}

class _Main_screenState extends State<Chat_screen> {
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
      // appBar: const CustomAppBar(),
      body: body(),
      // bottomNavigationBar: const CustomBottomNavigationBar(),
      drawer: myDrawer(),
    );
  }

  Widget body() {
    return const SafeArea(
      child: Center(
        child: Text("Chat Screen Body"),
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

