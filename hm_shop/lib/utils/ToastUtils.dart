import 'package:flutter/material.dart';

class ToastUtils {
  static void showToast(BuildContext context,String? msg) {
     ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        width: 120,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(40),
        ),
        behavior: SnackBarBehavior.floating, // 浮动显示
        content: Text(msg??'刷新成功',textAlign: TextAlign.center),
        duration: Duration(seconds: 10), // 显示时间
      ),
    );
  }
}

