import 'package:flutter/material.dart';

class Main_screen extends StatefulWidget {
  const Main_screen({super.key, required String title});

  @override
  State<StatefulWidget> createState() => _Main_screen();
}

class _Main_screen extends State<Main_screen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return body();
  }

  Widget body() {
    return const SafeArea(
      child:Center(
        child: Text ('hehe bắt đầu code màn hình trang chủ')
        ),
    ) ;
  }
}
