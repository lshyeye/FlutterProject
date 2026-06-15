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
    // 监听滚动事件
    _registerEvent();
  }

  void _registerEvent() {
    // 监听滚动事件
    _controller.addListener(() {
      // print('滚动啦${_controller.position.pixels}');
      // 滚动到最底部
      // _controller.position.pixels 滚动距离， _controller.position.maxScrollExtent 最大滚动距离
      if (_controller.position.pixels >= (_controller.position.maxScrollExtent - 50) ) {
        // 加载下一页更多数据
        _getRecommendList();
        // print('到底了');
      }
    });
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

  final ScrollController _controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    // Sliver 家族
    return CustomScrollView(
      // 绑定滚动控制器，监听滚动事件
      controller: _controller,
      slivers: _getScrollChildren(),
    );
  }

  // 页码 10,2*10,3*10
  int _page=1;
  bool _isLoading= false; // 当前是否正在加载状态
  bool _hasMore = true; // 是否还有下一页
  // 获取推荐列表
  void _getRecommendList() async {
    // 如果没有下一页或者正在请求
    if(_isLoading || !_hasMore ) {
      return;
    }
    _isLoading = true;
    int requestLimit = _page * 10;
    _recommendList = await getRecommendListAPI({"limit": requestLimit});
    // 阀门控制
    _isLoading = false;
    setState(() {});
    // 我要10条，你给10条，接着认为还有下一页
    // 我要10条，你给9条，就没有下一页
    if(_recommendList.length < requestLimit) {
      _hasMore = false;
      return ;
    }
    _page++;
  }
}
