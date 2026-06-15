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

// 获取分类列表
Future<List<CategoryItem>> getCategoryListAPI() async {
  // dioRequest 获取一个 dynamic
  final tt = ((await dioRequest.get(HttpConstants.CATEGORY_LIST)) as List).map((
    item,
  ) {
    return CategoryItem.fromJson(item as Map<String, dynamic>);
  }).toList();
  return tt;
}

// 获取特惠推荐 
Future<SpecialReCommendResult> getProductListAPI() async {
  return SpecialReCommendResult.fromJson(
    await dioRequest.get(HttpConstants.PRODUCT_LIST),
  );
}

// 获取热门推荐 
Future<SpecialReCommendResult> getInVogueListAPI() async {
  return SpecialReCommendResult.fromJson(
    await dioRequest.get(HttpConstants.IN_VOGUE_LIST),
  );
}

// 获取一站买全 
Future<SpecialReCommendResult> getOneStopListAPI() async {
  return SpecialReCommendResult.fromJson(
    await dioRequest.get(HttpConstants.ONE_STOP_LIST),
  );
}


Future<List<GoodDetailItem>> getRecommendListAPI(
  Map<String, dynamic> params,
) async {
  // 返回请求
  return ((await dioRequest.get(HttpConstants.RECOMMEND_LIST, params: params))
          as List)
      .map((item) {
        return GoodDetailItem.formJSON(item as Map<String, dynamic>);
      })
      .toList();
}