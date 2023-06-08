import 'package:flutter_frame_demo/pages/login/login_controller.dart';
import 'package:get/get.dart';

/// 控制器绑定(用来绑定controller到view)
class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController(), fenix: true);
  }
}