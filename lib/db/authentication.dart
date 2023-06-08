import 'dart:async';

import 'package:flutter_frame_demo/db/local_storage.dart';
import 'package:flutter_frame_demo/db/storage_constant.dart';
import 'package:flutter_frame_demo/global.dart';
import 'package:get/get.dart';

/// 检查是否有 token
Future<bool> isAuthenticated() async {
  var profileJSON = LocalStorage().getJSON(STORAGE_KEY_USER_PROFILE_EXIST);
  return profileJSON != null ? true : false;
}

/// 删除缓存token
Future deleteAuthentication() async {
  await LocalStorage().remove(STORAGE_KEY_USER_PROFILE_EXIST);
  // Global.profile = null;
}

/// 重新登录
void deleteTokenAndReLogin() async {
  await deleteAuthentication();
  Get.offAndToNamed('/login');
}
