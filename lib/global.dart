import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_frame_demo/db/local_storage.dart';
import 'package:flutter_frame_demo/pages/login/login_model.dart';

import 'db/storage_constant.dart';

/// 全局配置
class Global {
  /// 是否第一次打开
  static bool isFirstOpen = false;

  /// 是否已经登录过
  static bool isLoggedIn = false;

  /// 是否 release
  static bool get isRelease => const bool.fromEnvironment("dart.vm.product");

  /// init
  static Future init() async {
    // 运行初始
    WidgetsFlutterBinding.ensureInitialized();

    // 本地存储初始化
    await LocalStorage.init();

    // 极光推送初始化
    // await PushManager.setup();

    // 高德地图初始化
    // await AmapService.instance.init(
    //   iosKey: 'xxxx',
    //   androidKey: 'xxxx',
    // );

    // 读取设备第一次打开
    isFirstOpen = !LocalStorage().getBool(STORAGE_KEY_DEVICE_ALREADY_OPEN);
    if (isFirstOpen) {
      LocalStorage().setBool(STORAGE_KEY_DEVICE_ALREADY_OPEN, true);
    }
    // 读取离线用户信息
    isLoggedIn = UserInfo.getProfile() != null;

    // android 状态栏为透明的沉浸
    if (Platform.isAndroid) {
      SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    }
  }
}
