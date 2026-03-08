// 封装 api 返回业务侧的数据结构
import 'package:hm_shop/constants/index.dart';
import 'package:hm_shop/utils/DIORequest.dart';
import 'package:hm_shop/viewmodels/home.dart';

// 获取轮播图列表
Future<List<BannerItem>> getBannerListAPI() async {
  // dioRequest 获取一个 dynamic
  final tt = ((await dioRequest.get(HttpConstants.BANNER_LIST)) as List).map((
    item,
  ) {
    return BannerItem.fromJson(item as Map<String, dynamic>);
  }).toList();
  return tt;
}
