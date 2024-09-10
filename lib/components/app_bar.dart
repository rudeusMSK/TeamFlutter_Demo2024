import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Trang Chủ'),
      centerTitle: true,
      backgroundColor: Colors.blue
    );
  }
// cheo xin -> xin cheo
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
