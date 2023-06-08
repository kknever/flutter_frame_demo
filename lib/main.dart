import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_frame_demo/common/langs/translation_service.dart';
import 'package:flutter_frame_demo/global.dart';
import 'package:flutter_frame_demo/pages/index/index_binding.dart';
import 'package:flutter_frame_demo/pages/index/index_view.dart';
import 'package:flutter_frame_demo/router/app_pages.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() => Global.init().then((e) => runApp(const MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // return ScreenUtilInit(
    //     designSize: const Size(360, 690),
    //     minTextAdapt: true,
    //     splitScreenMode: true,
    //     builder: (context, child) {
          return GetMaterialApp(
            title: 'Flutter Frame Demo',
            home: const IndexPage(),
            initialBinding: IndexBinding(),
            debugShowCheckedModeBanner: false,
            enableLog: true,
            initialRoute: AppPages.INITIAL,
            getPages: AppPages.routes,
            unknownRoute: AppPages.unknownRoute,
            builder: EasyLoading.init(),
            // 国际化
            translations: TranslationService(),
            locale: TranslationService.locale,
            fallbackLocale: TranslationService.fallbackLocale,
          );
        // });
  }
}
