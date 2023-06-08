import 'dart:convert';

import 'package:flutter_frame_demo/bean/response/test_bean.dart';
import 'package:flutter_frame_demo/db/local_storage.dart';
import 'package:flutter_frame_demo/db/storage_constant.dart';

class UserInfo {

  static WelcomeData? getProfile() {
    var profileJSON = LocalStorage().getJSON(STORAGE_KEY_USER_PROFILE_EXIST);
    if (profileJSON != null) {
      return WelcomeData.fromJson(profileJSON);
    }
    return null;
  }

  // 持久化用户信息
  static Future<bool> saveProfile(WelcomeData data) {
    return LocalStorage().setJSON(STORAGE_KEY_USER_PROFILE_EXIST, data.toJson());
  }

  static Future<bool> clear() {
    return LocalStorage().clear();
  }
}