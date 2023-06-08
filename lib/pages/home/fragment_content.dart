import 'package:flutter/material.dart';
import 'package:flutter_frame_demo/bean/response/test_bean.dart';
import 'package:flutter_frame_demo/components/base_list.dart';
import 'package:flutter_frame_demo/pages/home/home_controller.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class FragmentContent extends GetView<HomeController> {
  const FragmentContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(40),
      child: Center(
        // child:  SmartRefresher(
        //   enablePullDown: true,
        //   enablePullUp: true,
        //   header: ClassicHeader(),
        //   footer: ClassicFooter(),
        //   controller: controller.refreshController,
        //   onRefresh: controller.onRefresh,
        //   onLoading: controller.onLoading,
        //   child: ListView.builder(
        //     itemCount: controller.dataList.length,
        //     itemBuilder: (BuildContext context, int index) {
        //       WelcomeData item= controller.dataList[index];
        //       //在这可以更具item的Type返回不同的Widget
        //       return Text(item.datas.length.toString());
        //     },
        //   ),
        // ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("11111"),
            Text('222222')
          ],
        ),
      ),
    );
  }
}