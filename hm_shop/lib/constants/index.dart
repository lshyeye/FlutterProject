class GlobalConstants {
   static const String baseUrl = 'https://meikou-api.itheima.net';  // 基础url
   static const int TIME_OUT = 10;  // 超时时间
   static const String SUCCESS_CODE = '1';  // 成功状态码
}

// 存放请求地址的接口的常量类
class HttpConstants {
  static const String BANNER_LIST = '/home/banner';  // 轮播图接口
  static const String CATEGORY_LIST = '/home/category/head';  // 分类列表接口
  static const String PRODUCT_LIST = '/hot/preference';  // 特惠推荐接口
  static const String IN_VOGUE_LIST = '/hot/inVogue';  // 热门推荐接口
  static const String ONE_STOP_LIST = '/hot/oneStop';  // 一站买全接口
  static const String RECOMMEND_LIST = "/home/recommend"; // 推荐列表
  static const String GUESS_LIST = "/home/goods/guessLike"; // 猜你喜欢
  // 返回的结构体是 GoodsItems 类型


}

// 1. 请求的地址有
// 2. 请求类型是 GoodItems 类型  => items => List<GoodsItems>
// 3. HmMoreList 要的是 List<GoodDetailItems> 类型
