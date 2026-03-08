// 首页 ViewModel
// 用于定义 List 数据
class BannerItem {
  String? id;
  String? imgUrl;
  BannerItem({required this.id, required this.imgUrl});
  // 扩展一个工厂函数，一般使用 factory 来声明创建 实例对象
  // 将 json 转换为真正的 bannerItem 实例对象
  factory BannerItem.fromJson(Map<String, dynamic> json) {
    return BannerItem(id: json['id'] ?? '', imgUrl: json['imgUrl'] ?? '');
  }
}

// flutter 必须强制转化，没有隐形转化类型
