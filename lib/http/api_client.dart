import 'package:dio/dio.dart';
import 'package:flutter_frame_demo/bean/response/test_bean.dart';
import 'package:flutter_frame_demo/config.dart';
import 'package:flutter_frame_demo/http/base_dio.dart';
import 'package:flutter_frame_demo/http/base_result.dart';
import 'package:retrofit/retrofit.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: '')
abstract class ApiClient {
  factory ApiClient() {
    return _ApiClient(BaseDio.getInstance().getDio(), baseUrl: SERVER_API_URL);
  }

  @GET('article/list/0/json')
  Future<BaseResult<WelcomeData>> test();

  // 测试Body传递JSON参数
  // @POST("test/login")
  // Future<BaseResult<Login>> login(@Body() Map<String, dynamic> param);
}