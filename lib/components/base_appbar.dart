import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_frame_demo/common/colors/colors.dart';

/// appbar 返回按钮类型
enum AppBarBackType { Back, Close, None }

const double kNavigationBarHeight = 44.0;

// 自定义 AppBar
class MyAppBar extends AppBar implements PreferredSizeWidget {
  MyAppBar({
    Key? key,
    Widget? title,
    AppBarBackType? leadingType,
    WillPopCallback? onWillPop,
    Widget? leading,
    Brightness? brightness,
    Color? backgroundColor,
    List<Widget>? actions,
    bool centerTitle = true,
    double? elevation,
  }) : super(
    key: key,
    title: title,
    centerTitle: centerTitle,
    systemOverlayStyle: SystemUiOverlayStyle.dark,
    // brightness: brightness ?? Brightness.light,
    backgroundColor: backgroundColor ?? AppColors.primaryBackground,
    leading: leading ?? (leadingType == AppBarBackType.None
        ? Container()
        : AppBarBack(leadingType ?? AppBarBackType.Back, onWillPop: onWillPop,)),
    actions: actions,
    elevation: elevation ?? 0,
  );

  @override
  get preferredSize => const Size.fromHeight(44);
}

// 自定义返回按钮
class AppBarBack extends StatelessWidget {
  final AppBarBackType _backType;
  final Color? color;
  final WillPopCallback? onWillPop;

  const AppBarBack(this._backType, {super.key, this.onWillPop, this.color});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final willBack = onWillPop == null ? true : await onWillPop!();
        if (!willBack) return;
        Navigator.pop(context);
      },
      child: _backType == AppBarBackType.Close
          ? Icon(Icons.close, color: color ?? const Color(0xFF222222), size: 24.0)
          : Container(
        padding: const EdgeInsets.only(right: 15),
        child: const Icon(Icons.arrow_back_ios_new, size: 24.0, color: Color(0xFF222222)),
      ),
    );
  }
}

class MyTitle extends StatelessWidget {
  final String _title;
  final Color? color;

  const MyTitle(this._title, {super.key, this.color});

  @override
  Widget build(BuildContext context) {
    return Text(_title,
        style: TextStyle(
            color: color ?? const Color(0xFF111111),
            fontSize: 20,
            fontWeight: FontWeight.w500));
  }
}
