import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_frame_demo/db/local_storage.dart';
import 'package:flutter_frame_demo/db/storage_constant.dart';
import 'package:flutter_frame_demo/global.dart';
import 'package:flutter_frame_demo/http/api_client.dart';
import 'package:flutter_frame_demo/pages/login/login_model.dart';
import 'package:flutter_frame_demo/router/app_pages.dart';
import 'package:get/get.dart';

/// 控制器(用来实现业务逻辑)
class LoginController extends GetxController {
  final apiClient = ApiClient();
  final phoneTextInputController = TextEditingController();
  final codeTextInputController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    phoneTextInputController.text = "13591919102";
    codeTextInputController.text = "123456";
  }

  void login() {
    EasyLoading.show(status: "登录中...");
    apiClient.test().then((it) {
      // print("data: $it");
      EasyLoading.dismiss();
      if(it.data != null) { // 跳转主页
        // 存储数据
        // LocalStorage().setJSON(STORAGE_KEY_USER_PROFILE_EXIST, it.data.toJson());
        // Global.saveProfile(it.data);
        UserInfo.saveProfile(it.data);
        Get.toNamed(AppRoutes.Home);
      }
    });
  }
}
