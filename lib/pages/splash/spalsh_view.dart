import 'package:flutter/material.dart';

/// 闪屏页
class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.green,
        child: const Center(
          child: Text('你好，这是欢迎页👏'),
        ),
      ),
    );
  }
}
