import 'package:flutter/material.dart';

// Lỗi j á:
Widget Errorbody(var user) => SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            const Text('hê hê lỗi ròi kìa ! -⁠ ＜(´⌯  ̫⌯`)＞'),
            const SizedBox(height: 8),
            const Text(' zí zụ lỗi:💕💕.'),

            // code xử lý show các lỗi khác ở đây -⁠ฅ^•ﻌ•^ฅ:
            // ...
            /* TODO: lỗi fa kè choai choai. xóa đi á */

            if (user.age != 0 && user.name.isEmpty)
              Text(
                'em chưa ${user.age}, tên em bị null.',
                style: const TextStyle(color: Colors.red),
              )
            else
              Text('tên em ${user.name}, em mới ${user.age} tủi.'),
            /* TODO: lỗi fa kè choai choai. xóa đi á */
            //...

            const Spacer(),
          ],
        ),
      ),
    );
