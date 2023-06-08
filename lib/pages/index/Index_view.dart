import 'package:flutter/material.dart';
import 'package:flutter_frame_demo/global.dart';
import 'package:flutter_frame_demo/pages/Index/Index_controller.dart';
import 'package:flutter_frame_demo/pages/home/home_view.dart';
import 'package:flutter_frame_demo/pages/login/login_view.dart';
import 'package:flutter_frame_demo/pages/splash/spalsh_view.dart';
import 'package:get/get.dart';

class IndexPage extends GetView<IndexController> {
  const IndexPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
      body: controller.showSplashPage.isTrue
          ? const SplashPage()
          : Global.isLoggedIn ? const HomePage() : const LoginPage(),
    ));
  }
}
