import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomBottomNavigationBar extends StatefulWidget
    implements PreferredSizeWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _buildIcon(String assetName, int index) {
    return Stack(
      alignment: Alignment.center,
      children: [
        if (_selectedIndex == index)
          Container(
            width: 40,
            height: 40,
            decoration: const BoxDecoration(
              color: Colors.amber,
              shape: BoxShape.circle,
            ),
          ),
        Image.asset(
          assetName,
          width: 24,
          height: 24,
          color: _selectedIndex == index ? Colors.white : Colors.grey,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(
          Radius.circular(20.0),
        ),
        child: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: _buildIcon('lib/public/icons/Home.png', 0),
              label: 'Trang Chủ',
            ),
            BottomNavigationBarItem(
              icon: _buildIcon('lib/public/icons/Edit.png', 1),
              label: 'cây púb',
            ),
            BottomNavigationBarItem(
              icon: _buildIcon('lib/public/icons/Love.png', 2),
              label: 'tym',
            ),
            BottomNavigationBarItem(
              icon: _buildIcon('lib/public/icons/Chat.png', 3),
              label: 'Chat chít',
            ),
            BottomNavigationBarItem(
              icon: _buildIcon('lib/public/icons/Profile.png', 4),
              label: 'Thông tin',
            ),
          ],
          backgroundColor: const Color(0xFF152354),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white,
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
      ),
    );
  }
}
