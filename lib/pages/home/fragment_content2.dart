import 'package:flutter/material.dart';
import 'package:flutter_frame_demo/pages/home/home_controller.dart';
import 'package:get/get.dart';

class FragmentContent2 extends GetView<HomeController> {
  const FragmentContent2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(40),
      child: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("33333"),
            Text('44444')
          ],
        ),
      ),
    );
  }
}