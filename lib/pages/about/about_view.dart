import 'package:flutter/material.dart';
import 'package:flutter_frame_demo/components/components.dart';
import 'package:flutter_frame_demo/pages/about/about_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class AboutPage extends GetView<AboutController> {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
        appBar: MyAppBar(
          centerTitle: true,
          title: const MyTitle("关于"),
          leadingType: AppBarBackType.Back,
        ),
        body: Container(
          padding: const EdgeInsets.all(16),
          child: const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 30,),
                Text("Demo APP"),
                Text("v1.0.0")
              ],
            ),
          ),
        )
    );
  }
}