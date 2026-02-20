import 'package:flutter/material.dart';
import 'package:hm_shop/components/Home/HmCategory.dart';
import 'package:hm_shop/components/Home/HmHot.dart';
import 'package:hm_shop/components/Home/HmMoreList.dart';
import 'package:hm_shop/components/Home/HmSlider.dart';
import 'package:hm_shop/components/Home/HmSuggestion.dart';
import 'package:hm_shop/viewmodels/home.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  // 轮播图的 3条数据
  final List<BannerItem> _bannerList = [
    BannerItem(
      id: '1',
      imgUrl: 'https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meituan/1.jpg',
    ),
    BannerItem(
      id: '2',
      imgUrl: 'https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meituan/2.jpg',
    ),
    BannerItem(
      id: '3',
      imgUrl: 'https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meituan/3.jpg',
    ),
  ];
  // https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meituan/1.jpg
  // https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meituan/2.jpg
  // https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meituan/3.jpg

  // 获取滚动容器的内容
  List<Widget> _getScrollChildren() {
    return [
      // 包裹普通widget 的slivert 家族的内容
      SliverToBoxAdapter(child: HmSlider(bannerList: _bannerList)),
      // 间距
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      // SliverGrid 和 SliverList 只能纵向排列
      // 横向布局，使用 ListView
      SliverToBoxAdapter(child: HmCategory()),
      // 间距
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      // 推荐
      SliverToBoxAdapter(child: HmSuggestion()),
      // 间距
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      SliverToBoxAdapter(
        // Flex 可以进行比例的分配
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Flex(
            direction: Axis.horizontal,
            children: [
              // 爆品
              Expanded(child: HmHot()),
              // 间距
              SizedBox(width: 10),
              // 爆品
              Expanded(child: HmHot()),
            ],
          ),
        ),
      ),
      // 间距
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      // 无限滚动列表
      HmMoreList(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    // Sliver 家族
    return CustomScrollView(slivers: _getScrollChildren());
  }
}
