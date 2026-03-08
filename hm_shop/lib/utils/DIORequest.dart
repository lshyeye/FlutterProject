//  基于 DIO 进行二次封装请求

import 'package:dio/dio.dart';
import 'package:hm_shop/constants/index.dart';

// 封装网络请求工具，基础地址，拦截器
class DioRequest {
  final _dio = Dio();
  DioRequest() {
    // 配置 Dio 实例
    // 连续赋值
    _dio.options
      ..baseUrl = GlobalConstants.baseUrl
      ..connectTimeout = Duration(seconds: GlobalConstants.TIME_OUT)
      ..sendTimeout = Duration(seconds: GlobalConstants.TIME_OUT)
      ..receiveTimeout = Duration(seconds: GlobalConstants.TIME_OUT);

    //  拦截器
    _addInterceptors();
  }
  // 添加拦截器
  void _addInterceptors() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (request, handler) {
          // 在请求被发送之前做一些事情
          handler.next(request); // 继续发送请求
        },
        onResponse: (response, handler) {
          // 在响应被返回之前做一些事情
          // return handler.next(response); // 继续返回响应
          if (response.statusCode! >= 200 && response.statusCode! < 300) {
            // 处理成功响应
            return handler.next(response);
          }
          handler.reject(DioException(requestOptions: response.requestOptions));
        },
        onError: (error, handler) {
          // 当请求失败时做一些事情
          handler.reject(error); // 继续返回错误
        },
      ),
    );
  }

  get(String url, {Map<String, dynamic>? params}) {
    return _handleResponse(_dio.get(url, queryParameters: params));
  }

  _handleResponse(Future<Response<dynamic>> task) async {
    try {
      Response<dynamic> res = await task;
      final data = res.data as Map<String, dynamic>; // data 才是接口的返回数据
      if (data['code'] == GlobalConstants.SUCCESS_CODE) {
        // 认定 http 状态和业务状态正常，正常放行
        // {code: 1, msg：'操作成功' , result: {...}}
        return data['result'];
      }
      throw Exception(data['msg']);
    } catch (e) {
      throw Exception(e);
    }
  }
}

final dioRequest = DioRequest(); // 单例对象


// dio 请求工具发出请求,返回的数据 Response<dynamic>.data 是动态类型
// 把所有的 data 先解构出来，拿到真正的数据，判断业务状态码 是不是1


