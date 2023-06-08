import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_frame_demo/pages/home/home_controller.dart';
import 'package:flutter_frame_demo/pages/login/login_model.dart';
import 'package:flutter_frame_demo/router/app_pages.dart';
import 'package:get/get.dart';

class FragmentSetting extends GetView<HomeController> {
  const FragmentSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("测试", style: TextStyle(color: Color(0xFFA2A2A7)),),
          const SizedBox(height: 10,),
          GestureDetector(
              onTap: ()=> EasyLoading.showToast("点击测试1111"),
              child: Container(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("测试1111"),
                    Icon(Icons.arrow_right),
                  ],
                ),
              )
          ),
          const Divider(height: 1, color: Color(0xFFE5E5E5),),
          const SizedBox(height: 10,),
          GestureDetector(
            onTap: ()=> EasyLoading.showToast("点击测试2222"),
            child: Container(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("测试2222"),
                  Icon(Icons.arrow_right),
                ],
              ),
            ),
          ),
          const Divider(height: 1, color: Color(0xFFE5E5E5),),
          const SizedBox(height: 10,),
          GestureDetector(
            onTap: ()=> Get.toNamed(AppRoutes.About),
            child: Container(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("关于"),
                  Icon(Icons.arrow_right),
                ],
              ),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                UserInfo.clear();
                Get.offAllNamed(AppRoutes.Login);
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red),
              ),
              child: const Text("退出登录"))
        ],
      ),
    );
  }
}