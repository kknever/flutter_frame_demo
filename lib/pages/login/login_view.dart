import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_frame_demo/common/colors/colors.dart';
import 'package:flutter_frame_demo/pages/login/login_controller.dart';
import 'package:flutter_frame_demo/router/app_pages.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

/// 视图(用来实现页面布局)
class LoginPage extends GetView<LoginController> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            // const SizedBox.expand(
            //     child: FittedBox(
            //         fit: BoxFit.fill,
            //         // 可设置背景图
            //         child: Image(image: AssetImage('assets/images/login_bg.png')))),
            LoginContentView(),
          ],
        ));
  }

  SingleChildScrollView LoginContentView() {

    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.fromLTRB(16, 123, 16, 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Image(image: AssetImage('assets/images/cat.png'), width: 100, height: 100,),
            Container(
                margin: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                child: const Text("欢迎", style: TextStyle(fontSize: 32, color: AppColors.primaryText))),
            const SizedBox(height: 50,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: controller.phoneTextInputController,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.phone),
                      hintText: "请输入手机号",
                      labelText: "手机号",
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFF4F4F4)),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF7EC6F3)),
                      )
                  ),),
                const SizedBox(height: 16,),
                Stack(
                  alignment: Alignment.centerRight,
                  children: [
                    TextField(
                      controller: controller.codeTextInputController,
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.numbers),
                          hintText: "输入验证码",
                          labelText: "验证码",
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFFF4F4F4)),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF7EC6F3)),
                          )
                      ),
                    ),
                    GestureDetector(
                      child: const Text(
                        "发送验证码",
                        style: TextStyle(color: Color(0xFF5F96EE)),
                      ),
                      onTap: () {
                        print("Send SMS");
                        EasyLoading.showToast("发送验证码");
                      },
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(height: 40,),
            SizedBox(
              width: double.infinity,
              child: loginButton(),
            ),
            const SizedBox(height: 10,),
            GestureDetector(
              onTap: () => Get.toNamed(AppRoutes.Proxy),
              child: const Text("代理设置", style: TextStyle(color: AppColors.primaryText),),
            ),
          ],
        ),
      ),
    );
  }

  Widget loginButton() {
    return Container(
      width: 335,
      height: 56,
      //在此设置
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(9),
        gradient: const LinearGradient(colors: [
          Color(0xFFF143C8),
          Color(0xFFB64AF4),
          Color(0xFF9E08E3),
        ]),
      ),
      child: ElevatedButton(
        onPressed: (){
          controller.login();
        },
        style: ButtonStyle(
          //去除阴影
          elevation: MaterialStateProperty.all(0),
          //将按钮背景设置为透明
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
        ),
        child: const Text(
          '注册/登录',
          style: TextStyle(fontSize: 17, color: Colors.white),
        ),
      ),
    );
  }
}
