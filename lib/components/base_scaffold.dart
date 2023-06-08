import 'package:flutter/material.dart';
import 'base_appbar.dart';

class BaseScaffold extends Scaffold {
  BaseScaffold({
    super.key,
    String? title,
    PreferredSizeWidget? appBar,
    required Widget body,
    List<Widget>? actions,
    AppBarBackType? leadType,
    WillPopCallback? onWillPop,
    Brightness brightness = Brightness.light,
    Widget? floatingActionButton,
    Color appBarBackgroundColor = Colors.white,
    Color? titleColor,
    bool centerTitle = true,
    FloatingActionButtonLocation? floatingActionButtonLocation,
    Widget? bottomNavigationBar}) : super(
      appBar: appBar ??
          MyAppBar(
            brightness: Brightness.light,
            leadingType: leadType ?? AppBarBackType.Back,
            onWillPop: onWillPop,
            actions: actions ?? [],
            centerTitle: centerTitle,
            title: MyTitle(title ?? '', color: titleColor ?? Colors.grey[800]),
            backgroundColor: appBarBackgroundColor,
          ),
      backgroundColor: Colors.white,
      body: body,
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: floatingActionButtonLocation,
      bottomNavigationBar: bottomNavigationBar
  );
}
