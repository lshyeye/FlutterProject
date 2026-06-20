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

// {"id":"1181622001","name":"气质女装","picture":"https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c1/qznz.png","children":[{"id":"1191110001","name":"半裙","picture":"https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c2/qznz_bq.png?quality=95&imageView","children":null,"goods":null},{"id":"1191110002","name":"衬衫","picture":"https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c2/qznz_cs.png?quality=95&imageView","children":null,"goods":null},{"id":"1191110022","name":"T恤","picture":"https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c2/qznz_tx.png?quality=95&imageView","children":null,"goods":null},{"id":"1191110023","name":"针织衫","picture":"https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c2/qznz_zzs.png?quality=95&imageView","children":null,"goods":null},{"id":"1191110024","name":"夹克","picture":"https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c2/qznz_jk.png?quality=95&imageView","children":null,"goods":null},{"id":"1191110025","name":"卫衣","picture":"https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c2/qznz_wy.png?quality=95&imageView","children":null,"goods":null},{"id":"1191110028","name":"背心","picture":"https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c2/qznz_bx.png?quality=95&imageView","children":null,"goods":null}],"goods":null},{"id":"1181622002","name":"女士内衣","picture":"https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c1/nsny.png","children":[{"id":"1191110003","name":"文胸","picture":"https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c2/nsny_wx.png?quality=95&imageView","children":null,"goods":null},{"id":"1191110004","name":"短袜","picture":"https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c2/nsny_dw.png?quality=95&imageView","children":null,"goods":null},{"id":"1191110005","name":"起居服","picture":"https://yanxuan.nosdn.127.net/f5797ca77cfe413e7753ec69f9bd4bb1.png?quality=95&imageView","children":null,"goods":null},{"id":"1191110029","name":"内裤","picture":"https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c2/nsny_nk.png?quality=95&imageView","children":null,"goods":null},{"id":"1191110030","name":"连裤袜","picture":"https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c2/nsny_lkw.png?quality=95&imageView","children":null,"goods":null},{"id":"1191110033","name":"塑身衣/塑身裤","picture":"https://yanxuan.nosdn.127.net/f5797ca77cfe413e7753ec69f9bd4bb1.png?quality=95&imageView","children":null,"goods":null},{"id":"1191110034","name":"内衣套装","picture":"https://yanxuan.nosdn.127.net/f5797ca77cfe413e7753ec69f9bd4bb1.png?quality=95&imageView","children":null,"goods":null}],"goods":null},{"id":"1181622003","name":"箱包手袋","picture":"https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c1/xbsd.png","children":[{"id":"1191110006","name":"单肩包","picture":"https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c2/xbsd_djb.png?quality=95&imageView","children":null,"goods":null},{"id":"1191110007","name":"双肩包","picture":"https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c2/xbsd_sjb.png?quality=95&imageView","children":null,"goods":null},{"id":"1191110008","name":"手提包","picture":"https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c2/xbsd_stb.png?quality=95&imageView","children":null,"goods":null},{"id":"1191110026","name":"斜挎包","picture":"https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c2/xbsd_xkb.png?quality=95&imageView","children":null,"goods":null}],"goods":null},{"id":"1181622004","name":"时尚饰品","picture":"https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c1/sssp.png","children":[{"id":"1191110009","name":"耳饰","picture":"https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c2/sssp_es.png?quality=95&imageView","children":null,"goods":null},{"id":"1191110010","name":"项链","picture":"https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c2/sssp_xl.png?quality=95&imageView","children":null,"goods":null},{"id":"1191110011","name":"手链/手镯","picture":"https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c2/sssp_sz.png?quality=95&imageView","children":null,"goods":null},{"id":"1191110012","name":"戒指","picture":"https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c2/sssp_jz.png?quality=95&imageView","children":null,"goods":null},{"id":"1191110014","name":"挂饰及其他","picture":"https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c2/sssp_js.png?quality=95&imageView","children":null,"goods":null}],"goods":null},{"id":"1181622005","name":"服饰配件","picture":"https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c1/zspj.png","children":[{"id":"1191110015","name":"渔夫帽","picture":"https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c2/fspj_yfm.png?quality=95&imageView","children":null,"goods":null},{"id":"1191110016","name":"贝雷帽","picture":"https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c2/fspj_blm.png?quality=95&imageView","children":null,"goods":null},{"id":"1191110017","name":"报童帽","picture":"https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c2/fspj_baotongmao.png?quality=95&imageView","children":null,"goods":null},{"id":"1191110018","name":"草帽","picture":"https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c2/fspj_cm.png?quality=95&imageView","children":null,"goods":null},{"id":"1191110036","name":"手套","picture":"https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c2/fspj_st.png?quality=95&imageView","children":null,"goods":null},{"id":"1191110037","name":"围巾丝巾","picture":"https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c2/fspj_wjsj.png?quality=95&imageView","children":null,"goods":null},{"id":"1191110040","name":"针织帽","picture":"https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c2/fspj_zzm.png?quality=95&imageView","children":null,"goods":null}],"goods":null},{"id":"1181622006","name":"时尚女鞋","picture":"https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c1/ssnx.png","children":[{"id":"1191110042","name":"休闲鞋","picture":"https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c2/ssnx_xxx.png?quality=95&imageView","children":null,"goods":null}],"goods":null},{"id":"1181622009","name":"眼镜配件","picture":"https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c1/yypj.png","children":[{"id":"1191110020","name":"太阳镜","picture":"https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c2/yjpj_tyj.png?quality=95&imageView","children":null,"goods":null},{"id":"1191110021","name":"光学眼镜","picture":"https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c2/yjpj_gxyj.png?quality=95&imageView","children":null,"goods":null}],"goods":null}
// 根据 json 推断出 class 对象和工厂转化函数
class CategoryItem {
  String? id;
  String? name;
  String? picture;
  List<CategoryItem>? children;
  CategoryItem({
    required this.id,
    required this.name,
    required this.picture,
    this.children,
  });
  // 扩展一个工厂函数，一般使用 factory 来声明创建 实例对象
  // 将 json 转换为真正的 bannerItem 实例对象
  factory CategoryItem.fromJson(Map<String, dynamic> json) {
    return CategoryItem(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      picture: json['picture'] ?? '',
      children: json['children'] != null
          ? (json['children'] as List)
                .map(
                  (item) => CategoryItem.fromJson(item as Map<String, dynamic>),
                )
                .toList()
          : null,
    );
  }
}

// 特惠推荐相关类型, 接口的层级数据结构
class GoodsItem {
  String? id;
  String? name;
  String? desc;
  String? price;
  String? picture;
  int? orderNum;
  GoodsItem({
    required this.id,
    required this.name,
    this.desc,
    required this.price,
    required this.picture,
    required this.orderNum,
  });
  factory GoodsItem.fromJson(Map<String, dynamic> json) {
    return GoodsItem(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      desc: json['desc'],
      price: json['price'] ?? '',
      picture: json['picture'] ?? '',
      orderNum: json['orderNum'] as int?,
    );
  }
}

class GoodsItems {
  int? counts;
  int? pageSize;
  int? pages;
  int? page;
  List<GoodsItem>? items;
  GoodsItems({
    required this.counts,
    required this.pageSize,
    required this.pages,
    required this.page,
    this.items,
  });
  factory GoodsItems.fromJson(Map<String, dynamic> json) {
    return GoodsItems(
      counts: json['counts'] as int?,
      pageSize: json['pageSize'] as int?,
      pages: json['pages'] as int?,
      page: json['page'] as int?,
      items: json['items'] != null
          ? (json['items'] as List)
                .map((item) => GoodsItem.fromJson(item as Map<String, dynamic>))
                .toList()
          : null,
    );
  }
}

class SubType {
  String? id;
  String? title;
  GoodsItems? goodsItems;
  SubType({required this.id, required this.title, this.goodsItems});
  factory SubType.fromJson(Map<String, dynamic> json) {
    return SubType(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      goodsItems: json['goodsItems'] != null
          ? GoodsItems.fromJson(json['goodsItems'] as Map<String, dynamic>)
          : null,
    );
  }
}

class SpecialReCommendResult {
  String? id;
  String? title;
  List<SubType>? subTypes;
  SpecialReCommendResult({
    required this.id,
    required this.title,
    required this.subTypes,
  });
  factory SpecialReCommendResult.fromJson(Map<String, dynamic> json) {
    return SpecialReCommendResult(
      id: json['id']?.toString() ?? '',
      title: json['title']?.toString() ?? '',
      subTypes: (json['subTypes'] as List?)
          ?.map((item) => SubType.fromJson(item as Map<String, dynamic>))
          .toList() ?? [],
    );
  }
}

class GoodDetailItem extends GoodsItem {
  int payCount = 0;

  /// 商品详情项
  GoodDetailItem({
    required super.id,
    required super.name,
    required super.price,
    required super.picture,
    required super.orderNum,
    required this.payCount,
  }) : super(desc: "");
  // 转化方法
  factory GoodDetailItem.fromJson(Map<String, dynamic> json) {
    return GoodDetailItem(
      id: json["id"]?.toString() ?? "",
      name: json["name"]?.toString() ?? "",
      price: json["price"]?.toString() ?? "",
      picture: json["picture"]?.toString() ?? "",
      orderNum: int.tryParse(json["orderNum"]?.toString() ?? "0") ?? 0,
      payCount: int.tryParse(json["payCount"]?.toString() ?? "0") ?? 0,
    );
  }
}


class GoodsDetailsItems {
  int? counts;
  int? pageSize;
  int? pages;
  int? page;
  List<GoodDetailItem>? items;
  GoodsDetailsItems({
    required this.counts,
    required this.pageSize,
    required this.pages,
    required this.page,
    this.items,
  });
  factory GoodsDetailsItems.fromJson(Map<String, dynamic> json) {
    return GoodsDetailsItems(
      counts: json['counts'] as int?,
      pageSize: json['pageSize'] as int?,
      pages: json['pages'] as int?,
      page: json['page'] as int?,
      items: json['items'] != null
          ? (json['items'] as List)
                .map((item) => GoodDetailItem.fromJson(item as Map<String, dynamic>))
                .toList()
          : null,
    );
  }
}
