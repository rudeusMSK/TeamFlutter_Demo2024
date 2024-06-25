import 'package:flutter/material.dart';
import 'package:mainpage_detailuser_v1/components/app_bar.dart';
import 'package:mainpage_detailuser_v1/components/bottom_navigationbar.dart';

// ignore: camel_case_types
class Love_screen extends StatefulWidget {
  const Love_screen({super.key,});

  @override
  State<Love_screen> createState() => _LoveScreenState();
}

class _LoveScreenState extends State<Love_screen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body(),
    );
  }

  Widget body() {
    return const SafeArea(
      child: Center(
        child: Text("Love Screen Body"),
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
        ],
      ),
    );
  }
}
