import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';
import 'package:kortobaa_task/Core/Theme/LightTheme.dart';
import 'package:kortobaa_task/Features/auth/presentaion/view/login_screen.dart';
import 'package:kortobaa_task/Features/tabsScreens/presentaion/view/tabs_screen.dart';
import 'Core/Utils/App Strings.dart';
import 'app_router.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.widgetScreen,});
  final Widget widgetScreen;


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // TODO: Localize the app name
      debugShowCheckedModeBanner: false,
      title: AppString.appName,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: lightTheme,
      navigatorKey: AppRouter.navigatorKey,
      routes: AppRouter.routes,
      home: widgetScreen,
    );
  }
}

