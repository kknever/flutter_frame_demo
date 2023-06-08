import 'package:flutter_frame_demo/pages/home/home_controller.dart';
import 'package:get/get.dart';
import 'package:flutter_frame_demo/pages/Index/Index_controller.dart';
import 'package:flutter_frame_demo/pages/login/login_controller.dart';

class IndexBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IndexController>(() => IndexController());
    // 因为闪屏页不一定调用Get路由，所以一并初始化LoginController
    Get.lazyPut<LoginController>(() => LoginController());
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
