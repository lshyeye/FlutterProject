import 'package:flutter/material.dart';
import 'package:hm_shop/api/home.dart';
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
  // 分类列表
  List<CategoryItem> _categoryList = [];
  // 轮播图的 3条数据
  List<BannerItem> _bannerList = [
    // BannerItem(
    //   id: '1',
    //   imgUrl: 'https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meituan/1.jpg',
    // ),
    // BannerItem(
    //   id: '2',
    //   imgUrl: 'https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meituan/2.jpg',
    // ),
    // BannerItem(
    //   id: '3',
    //   imgUrl: 'https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meituan/3.jpg',
    // ),
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
      SliverToBoxAdapter(child: HmCategory(categoryList: _categoryList)),
      // 间距
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      // 推荐
      SliverToBoxAdapter(
        child: HmSuggestion(specialReCommendResult: _productList),
      ),
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
              // Expanded(child: HmHot()),
              // // 间距
              // SizedBox(width: 10),
              // // 爆品
              // Expanded(child: HmHot()),
              Expanded(
                child: HmHot(result: _inVogueResult, type: "hot"),
              ),
              SizedBox(width: 10),
              Expanded(
                child: HmHot(result: _oneStopResult, type: "step"),
              ),
            ],
          ),
        ),
      ),
      // 间距
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      // 无限滚动列表
      HmMoreList(recommendList: _recommendList),
    ];
  }

  // 特惠推荐数据
  SpecialReCommendResult _productList = SpecialReCommendResult(
    id: '',
    title: '',
    subTypes: [],
  );
  // 热门推荐数据
  SpecialReCommendResult _inVogueResult = SpecialReCommendResult(
    id: '',
    title: '',
    subTypes: [],
  );
  // 一站买全数据
  SpecialReCommendResult _oneStopResult = SpecialReCommendResult(
    id: '',
    title: '',
    subTypes: [],
  );

  List<GoodDetailItem> _recommendList = [];


  @override
  void initState() {
    super.initState();
    // 初始化轮播图数据
    _getBannerList();
    // 初始化分类列表数据
    _getCategoryList();
    // 初始化特惠推荐数据
    _getProductList();
    // 初始化热门推荐数据
    _getInVogueList();
    // 初始化一站买全数据
    _getOneStopList();
    _getRecommendList();
  }

  // 获取轮播图列表
  void _getBannerList() async {
    _bannerList = await getBannerListAPI();
    setState(() {});
  }

  // 获取分类列表
  void _getCategoryList() async {
    _categoryList = await getCategoryListAPI();
    setState(() {});
  }

  // 获取特惠推荐数据
  void _getProductList() async {
    _productList = await getProductListAPI();
    setState(() {});
  }

  // 获取热门推荐数据
  void _getInVogueList() async {
    _inVogueResult = await getInVogueListAPI();
    setState(() {});
  }

  // 获取一站买全数据
  void _getOneStopList() async {
    _oneStopResult = await getOneStopListAPI();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // Sliver 家族
    return CustomScrollView(slivers: _getScrollChildren());
  }

   // 获取推荐列表
  void _getRecommendList() async {
    _recommendList = await getRecommendListAPI({"limit": 10});
    setState(() {});
  }

}


