import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hm_shop/viewmodels/home.dart';

class HmSlider extends StatefulWidget {
  // 轮播图数据
  final List<BannerItem> bannerList;
  HmSlider({Key? key, required this.bannerList}) : super(key: key);

  @override
  _HmSliderState createState() => _HmSliderState();
}

class _HmSliderState extends State<HmSlider> {
  // 控制轮播图跳转的 控制器
  CarouselSliderController _controller = CarouselSliderController();

  int _currentIndex = 0;
  // 在 flutter 中获取屏幕宽度的方法
  // 轮播图 索引
  Widget _getSlider() {
    // 根据渲染的不同的轮播选项
    // MediaQuery.of(context).size.width
    // 媒体查询  MediaQuery
    final double screenWidth = MediaQuery.of(context).size.width;
    return CarouselSlider(
      carouselController: _controller, //controller 用于控制轮播图的切换
      items: List.generate(widget.bannerList.length, (int index) {
        return Image.network(
          widget.bannerList[index].imgUrl ?? '',
          fit: BoxFit.cover,
          width: screenWidth,
        );
      }),
      options: CarouselOptions(
        // 视口占比
        viewportFraction: 1.0,
        // 是否自动播放
        autoPlay: true,
        // 自动播放的间隙时间
        autoPlayInterval: Duration(seconds: 1),
        onPageChanged: (int index, reason) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }

  // 用于定位轮播图上面的搜索框
  // 搜索框
  Widget _getSearch() {
    return Positioned(
      top: 10,
      left: 0,
      right: 0,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 40),
          height: 50,
          decoration: BoxDecoration(
            color: const Color.fromRGBO(0, 0, 0, 0.4),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Text(
            '搜索....',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ),
    );
  }

  //  返回指示灯导航组件
  Widget _getDots() {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 10,
      child: SizedBox(
        height: 40,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          // 有几个指示灯
          children: List.generate(widget.bannerList.length, (int index) {
            return GestureDetector(
              // 点击切换轮播图
              // 绑定控制器 animateToPage 动画跳转到某个页面
              onTap: () => _controller.animateToPage(index),
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                height: 6,
                // 激活的时候是宽的指示灯
                width: _currentIndex == index ? 40 : 20,
                margin: EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  // 没有激活的时候就是一个黑色的透明色
                  color: index == _currentIndex ? Colors.white : Color.fromRGBO(0, 0, 0, 0.3),
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [_getSlider(), _getSearch(), _getDots()]);
    // Stack —> 轮播图 搜索框 指示灯导航
    // return Container(
    //   height: 300,
    //   color:Colors.blue,
    //   alignment: Alignment.center,
    //   child: Text('轮播图', style: TextStyle(color: Colors.white, fontSize: 20)),
    // );
  }
}
