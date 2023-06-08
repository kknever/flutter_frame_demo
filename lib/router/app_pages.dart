import 'package:flutter_frame_demo/pages/about/about_binding.dart';
import 'package:flutter_frame_demo/pages/about/about_view.dart';
import 'package:flutter_frame_demo/pages/home/home_binding.dart';
import 'package:flutter_frame_demo/pages/home/home_view.dart';
import 'package:flutter_frame_demo/pages/index/Index_view.dart';
import 'package:flutter_frame_demo/pages/login/login_binding.dart';
import 'package:flutter_frame_demo/pages/login/login_view.dart';
import 'package:flutter_frame_demo/pages/notfound/notfound_view.dart';
import 'package:flutter_frame_demo/pages/proxy/proxy_view.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = AppRoutes.Index;

  static final routes = [
    GetPage(
      name: AppRoutes.Index,
      page: () => const IndexPage(),
    ),
    GetPage(
      name: AppRoutes.Login,
      page: () => const LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.Home,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.Proxy,
      page: () => ProxyPage(),
    ),
    GetPage(
      name: AppRoutes.About,
      page: () => const AboutPage(),
      binding: AboutBinding()
    ),
  ];

  static final unknownRoute = GetPage(
    name: AppRoutes.NotFound,
    page: () => const NotFoundPage(),
  );
}
