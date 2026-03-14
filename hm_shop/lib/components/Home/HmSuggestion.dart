import 'package:flutter/material.dart';
import 'package:hm_shop/viewmodels/home.dart';

class HmSuggestion extends StatefulWidget {
  // 特惠推荐数据
  final SpecialReCommendResult specialReCommendResult;
  HmSuggestion({Key? key, required this.specialReCommendResult})
    : super(key: key);

  @override
  _HmSuggestionState createState() => _HmSuggestionState();
}

class _HmSuggestionState extends State<HmSuggestion> {
  // 获取前三条数据
  List<GoodsItem> _getDisplayItems() {
    // 初始化如果还没获取到数据的时候，返回空列表
    if (widget.specialReCommendResult.subTypes!.isEmpty) {
      return [];
    }
    return widget.specialReCommendResult.subTypes!.first.goodsItems!.items
            ?.take(3)
            .toList() ??
        [];
  }

  // 头部标题
  Widget _buildHeader() {
    return Row(
      children: [
        Text(
          '特惠推荐',
          style: TextStyle(
            fontSize: 18,
            color: const Color.fromARGB(255, 86, 24, 21),
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(width: 10),
        Text(
          '精选省攻略',
          style: TextStyle(
            fontSize: 12,
            color: const Color.fromARGB(255, 124, 63, 58),
          ),
        ),
      ],
    );
  }

  // 左侧结构
  Widget _buildLeft() {
    return Container(
      width: 100,
      height: 140,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage("lib/assets/home_cmd_inner.png"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  List<Widget> _getChildrenList() {
    List<GoodsItem> list = _getDisplayItems();
    return List.generate(list.length, (int index) {
      return Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              // 图片加载失败时，执行这个函数，执行替换的静态资源
              errorBuilder: (context, error, stackTrace) {
                return Image.asset(
                  'lib/assets/home_cmd_inner.png',
                  width: 100,
                  height: 140,
                  fit: BoxFit.cover,
                );
              },
              list[index].picture ?? '',
              width: 100,
              height: 140,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 240, 96, 12),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              "￥${list[index].price ?? ''}" ?? '',
              style: TextStyle(
                fontSize: 14,
                color: const Color.fromARGB(255, 86, 24, 21),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      );
    });
  }

  // 完成渲染
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        // height: 300,
        // color: Colors.blue,
        padding: EdgeInsets.all(12),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(12),
          image: DecorationImage(
            // AssetImage 本地资源
            image: AssetImage('lib/assets/home_cmd_sm.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            // 顶部内容
            _buildHeader(),
            SizedBox(height: 10),
            Row(
              children: [
                _buildLeft(),
                // 占满剩余空间
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: _getChildrenList(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
