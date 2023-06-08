import 'package:flutter/material.dart';
import 'package:flutter_frame_demo/pages/home/home_controller.dart';
import 'package:get/get.dart';

class FragmentHome extends GetView<HomeController> {
  const FragmentHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("title".tr), // GetX国际化方式
        Text("login".tr),
        Center(child: Text(controller.count.toString())),
        TextButton(onPressed: () => controller.increment(), child: const Text('Click Me Count++')),
        ElevatedButton(onPressed: ()=>controller.testCallNative(), child: const Text("测试Channel"))
      ],
    ));
  }
}