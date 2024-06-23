import 'package:flutter/material.dart';
import 'package:mainpage_detailuser_v1/components/app_bar.dart';

class Main_screen extends StatefulWidget {
  const Main_screen({super.key, required this.title});
  final String title;

  @override
  State<Main_screen> createState() => _Main_screenState();
}

class _Main_screenState extends State<Main_screen> {
  
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
      appBar: const CustomAppBar(),
      body: body(),
            bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Trang Chủ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'cây púb',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'tym',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Chat chít',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Thông tin',
          ),
        ],
        
backgroundColor: const Color(0xFF152354),
        selectedItemColor: Colors.white,
        unselectedItemColor:
            Colors.white,
        selectedIconTheme: const IconThemeData(
          color: Colors.amber,
        ),
        unselectedIconTheme: const IconThemeData(
          color: Colors.white,
        ),
        type: BottomNavigationBarType.fixed, 
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      drawer: myDrawer(),
    );
  }

  Widget body() {
    return const SafeArea(
      child: Center(
        child: Text("Main Screen Body"),
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