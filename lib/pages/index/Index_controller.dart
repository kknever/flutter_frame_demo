import 'package:get/get.dart';

class IndexController extends GetxController {
  // 是否展示闪屏页面
  var showSplashPage = true.obs;

  @override
  void onReady() {
    startCountdownTimer();
  }

  @override
  void onClose() {}

  // 展示欢迎页，倒计时1.5秒之后进入应用
  Future startCountdownTimer() async {
    await Future.delayed(const Duration(milliseconds: 1500), () {
      showSplashPage.value = false;
    });
  }
}
