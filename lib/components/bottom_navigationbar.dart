import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const CustomBottomNavigationBar({
    required this.selectedIndex,
    required this.onItemTapped,
    super.key,
  });

  Widget _buildIcon(String assetName, int index) {
    return Stack(
      alignment: Alignment.center,
      children: [
        if (selectedIndex == index)
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
          color: selectedIndex == index ? Colors.white : Colors.grey,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0), // or 15.0 - 20.0
      child: ClipRRect(
        borderRadius: const BorderRadius.all(
          Radius.circular(20.0),
        ),
        child: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            // home = 0
            BottomNavigationBarItem(
              icon: _buildIcon('lib/public/icons/Home.png', 0),
              label: 'Trang Chủ',
            ),
            // edit = 1
            BottomNavigationBarItem(
              icon: _buildIcon('lib/public/icons/Edit.png', 1),
              label: 'cây púb',
            ),
            // love = 2
            BottomNavigationBarItem(
              icon: _buildIcon('lib/public/icons/Love.png', 2),
              label: 'tym',
            ),
            // chat = 3
            BottomNavigationBarItem(
              icon: _buildIcon('lib/public/icons/Chat.png', 3),
              label: 'Chat chít',
            ),
            // profile = 4
            BottomNavigationBarItem(
              icon: _buildIcon('lib/public/icons/Profile.png', 4),
              label: 'Thông tin',
            ),
          ],
          backgroundColor: const Color(0xFF152354),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white,
          // icon select:
          selectedIconTheme: const IconThemeData(
            color: Colors.amber,
          ),
          // icon select:
          unselectedIconTheme: const IconThemeData(
            color: Colors.white,
          ),
          type: BottomNavigationBarType.fixed,
          currentIndex: selectedIndex,
          onTap: onItemTapped,
        ),
      ),
    );
  }
}
