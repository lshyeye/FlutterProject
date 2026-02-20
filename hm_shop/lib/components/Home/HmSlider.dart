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
  // 在 flutter 中获取屏幕宽度的方法
  // 轮播图 索引
  Widget _getSlider() {
    // 根据渲染的不同的轮播选项
    // MediaQuery.of(context).size.width
    // 媒体查询  MediaQuery
  final double screenWidth = MediaQuery.of(context).size.width;
    return CarouselSlider(
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
        autoPlay: true,
        // 自动播放的间隙时间
        autoPlayInterval: Duration(seconds: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [_getSlider()]);
    // Stack —> 轮播图 搜索框 指示灯导航
    // return Container(
    //   height: 300,
    //   color:Colors.blue,
    //   alignment: Alignment.center,
    //   child: Text('轮播图', style: TextStyle(color: Colors.white, fontSize: 20)),
    // );
  }
}
