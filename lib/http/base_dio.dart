import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_frame_demo/db/authentication.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

/// 网络请求Dio
class BaseDio {
  // 私有构造函数
  BaseDio._() {
    // 具体初始化代码
  }
  // 单例公开访问点
  factory BaseDio() =>getInstance();

  // 静态私有成员，没有初始化
  static BaseDio? _instance;

  // 静态、同步、私有访问点
  static BaseDio getInstance() {
    _instance ??= BaseDio._();
    return _instance!;
  }

  Dio getDio() {
    final Dio dio = Dio();
    dio.options = BaseOptions(receiveTimeout: const Duration(seconds: 30), connectTimeout: const Duration(seconds: 30)); // 设置超时时间等 ...
    // proxy
    // String ip = "12.4.2.1";
    // String port = "12131";
    // String proxy = "PROXY $ip:$port";
    // (dio.httpClientAdapter as IOHttpClientAdapter).onHttpClientCreate = (client) {
    //   client.findProxy = (url) {
    //     return proxy;
    //   };
    //   // Trust certificate for https proxy
    //   client.badCertificateCallback = (cert, host, port) {
    //     return true;
    //   };
    //   return client;
    // };
    // Cookie管理
    CookieJar cookieJar = CookieJar();
    dio.interceptors.add(CookieManager(cookieJar));

    // 添加拦截器
    dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      // 在请求被发送之前做一些预处理
      options.headers["token"] = "11000010201012010012";
      return handler.next(options); //continue
    }, onResponse: (response, handler) {
      // 在返回响应数据之前做一些预处理
      return handler.next(response);
    }, onError: (DioException e, handler) {
      // 当请求失败时做一些预处理
      ErrorEntity eInfo = createErrorEntity(e);
      // 错误提示
      EasyLoading.showInfo("出错啦～\n${eInfo.toString()}");
      // 错误交互处理
      switch (eInfo.code) {
        case 401: // 没有权限 重新登录
          deleteTokenAndReLogin();
          break;
        default:
      }
      return handler.next(e);
    }));

    // 输出日志
    // dio.interceptors.add(PrettyDioLogger(
    //   requestHeader: true,
    //   requestBody: true,
    //   responseBody: true,
    //   responseHeader: true,
    //   compact: false,
    // ));

    return dio;
  }

  // error统一处理
  ErrorEntity createErrorEntity(DioError error) {
    switch (error.type) {
      case DioExceptionType.cancel:
        return ErrorEntity(code: -1, message: "请求取消");
      case DioExceptionType.connectionTimeout:
        return ErrorEntity(code: -1, message: "连接超时");
      case DioExceptionType.sendTimeout:
        return ErrorEntity(code: -1, message: "请求超时");
      case DioExceptionType.receiveTimeout:
        return ErrorEntity(code: -1, message: "响应超时");
      case DioExceptionType.badResponse:
        try {
          int? errCode = error.response?.statusCode;
          if (errCode == null) {
            return ErrorEntity(code: -2, message: error.message);
          }
          switch (errCode) {
            case 400:
              return ErrorEntity(
                  code: errCode,
                  message: error.response?.data['error'] ?? "请求语法错误");
            case 401:
              return ErrorEntity(
                  code: errCode,
                  message: error.response?.data['error'] ?? "没有权限");
            case 403:
              return ErrorEntity(
                  code: errCode,
                  message: error.response?.data['error'] ?? "服务器拒绝执行");
            case 404:
              return ErrorEntity(code: errCode, message: "无法连接服务器");
            case 405:
              return ErrorEntity(
                  code: errCode,
                  message: error.response?.data['error'] ?? "请求方法被禁止");
            case 500:
              return ErrorEntity(code: errCode, message: "服务器内部错误");
            case 502:
              return ErrorEntity(code: errCode, message: "无效的请求");
            case 503:
              return ErrorEntity(
                  code: errCode,
                  message: error.response?.data['error'] ?? "服务器挂了");
            case 505:
              return ErrorEntity(
                  code: errCode,
                  message: error.response?.data['error'] ?? "不支持HTTP协议请求");
            default:
              return ErrorEntity(
                  code: errCode, message: error.response?.data['error']);
          }
        } on Exception catch (_) {
          return ErrorEntity(code: -1, message: "未知错误");
        }
      default:
        return ErrorEntity(code: -1, message: error.message);
    }
  }
}

// 异常处理
class ErrorEntity implements Exception {
  int code;
  String? message;

  ErrorEntity({required this.code, this.message});

  @override
  String toString() {
    return "Code: $code, $message";
  }
}
