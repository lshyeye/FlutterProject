// 管理路由

import 'package:flutter/material.dart';
import 'package:hm_shop/pages/Main/index.dart';
import 'package:hm_shop/pages/Login/index.dart';

Widget getRootWidget( ) {
  return MaterialApp(
    // 命名路由
    routes: getRouteRoutes(),
  );
}

// 炉头匹配 Map
Map<String, Widget Function(BuildContext)> getRouteRoutes() {
  return {
    // 主页路由
    '/': (context) => MainPage(), 
    // 登录路由
    '/login': (context) => LoginPage(),
  };
}
