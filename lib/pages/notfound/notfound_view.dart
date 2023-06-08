import 'package:flutter/material.dart';
import 'package:flutter_frame_demo/components/components.dart';
import 'package:flutter_frame_demo/router/app_pages.dart';
import 'package:get/get.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: const MyTitle("路由未找到~"),
      ),
      body: ListTile(
        title: const Text("返回首页"),
        subtitle: const Text('返回首页'),
        onTap: () => Get.offAllNamed(AppRoutes.Home),
      ),
    );
  }
}
