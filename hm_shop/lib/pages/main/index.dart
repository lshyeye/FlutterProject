// 主页
import 'package:flutter/material.dart';
import 'package:hm_shop/pages/Cart/index.dart';
import 'package:hm_shop/pages/Category/index.dart';
import 'package:hm_shop/pages/Home/index.dart';
import 'package:hm_shop/pages/Mine/index.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  // 定义数据， 根据数据渲染 4个导航
  List<Map<String, String>> _tabList = [
    {
      "icon": "lib/assets/ic_public_home_normal.png", // 正常图标
      "active_Icon": "lib/assets/ic_public_home_active.png", // 激活的图标
      "text": "首页",
    },
    {
      "icon": "lib/assets/ic_public_pro_normal.png",
      "active_Icon": "lib/assets/ic_public_pro_active.png",
      "text": "分类",
    },
    {
      "icon": "lib/assets/ic_public_cart_normal.png",
      "active_Icon": "lib/assets/ic_public_cart_active.png",
      "text": "购物车",
    },
    {
      "icon": "lib/assets/ic_public_my_normal.png",
      "active_Icon": "lib/assets/ic_public_my_active.png",
      "text": "我的",
    },
  ];

  // 导航栏元素的渲染
  List<BottomNavigationBarItem> _getTabBarWidget() {
    return List.generate(_tabList.length, (index) {
      return BottomNavigationBarItem(
        icon: Image.asset(_tabList[index]["icon"]!, width: 30, height: 30),
        activeIcon: Image.asset(
          _tabList[index]["active_Icon"]!,
          width: 30,
          height: 30,
        ),
        label: _tabList[index]["text"]!,
      );
    });
  }

  //
  List<Widget> _getChildren() {
    return [HomeView(), CategoryView(), CartView(), MineView()];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 安全区
      // 当前选中的索引是通过 IndexedStack 进行获取的
      // 安全区组件渲染
      body: SafeArea(
        child: IndexedStack(index: _currentIndex, children: _getChildren()),
      ),
      // 底部导航栏
      bottomNavigationBar: BottomNavigationBar(
        // 选中的颜色
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
        // 展示未选中的标签
        showUnselectedLabels: true,
        // 点击事件
        onTap: (int index) {
          // index 就是当前点击的索引
          setState(() {
            _currentIndex = index;
          });
        },
        // 当前目前是激活的索引
        currentIndex: _currentIndex,
        items: _getTabBarWidget(),
      ),
    );
  }
}
