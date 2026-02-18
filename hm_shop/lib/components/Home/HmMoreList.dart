import 'package:flutter/material.dart';

class HmMoreList extends StatefulWidget {
  HmMoreList({Key? key}) : super(key: key);

  @override
  _HmMoreListState createState() => _HmMoreListState();
}

class _HmMoreListState extends State<HmMoreList> {
  @override
  Widget build(BuildContext context) {
    // 网格是 2 列
    return SliverGrid.builder(
      // 网格式 2列
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Container(
            height: 100,
            color: Colors.blue,
            alignment: Alignment.center,
            child: Text(
              '商品',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
        );
      },
    );
  }
}
