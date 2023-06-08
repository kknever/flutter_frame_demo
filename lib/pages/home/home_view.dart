import 'package:flutter/material.dart';
import 'package:flutter_frame_demo/components/components.dart';
import 'package:flutter_frame_demo/pages/home/fragment_content.dart';
import 'package:flutter_frame_demo/pages/home/fragment_content2.dart';
import 'package:flutter_frame_demo/pages/home/fragment_home.dart';
import 'package:flutter_frame_demo/pages/home/fragment_setting.dart';
import 'package:flutter_frame_demo/pages/home/home_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => BaseScaffold(
      appBar: MyAppBar(
        centerTitle: true,
        title: MyTitle(controller.getAppBarTitle()),
        leadingType: AppBarBackType.None,
      ),
      body: IndexedStack(
        index: controller.currentTab.value,
        children: const [
          FragmentHome(),
          FragmentContent(),
          FragmentContent2(),
          FragmentSetting(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: controller.currentTab.value,
        onTap: (int index) => controller.changeTab(index),
        iconSize: 30.0,
        fixedColor: Colors.pink,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "首页"),
          BottomNavigationBarItem(icon: Icon(Icons.category), label: "测试1"),
          BottomNavigationBarItem(icon: Icon(Icons.category), label: "测试2"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "我的"),
        ],
      ),
    ));
  }
}
