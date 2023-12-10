import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Core/Network/Local/cache_keys.dart';
import 'Core/Network/Local/cache_storage.dart';
import 'Core/Utils/Assets Manager.dart';
import 'Core/service_locator/service_locator.dart';
import 'Features/auth/presentaion/view/login_screen.dart';
import 'Features/tabsScreens/presentaion/view/tabs_screen.dart';
import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  EasyLocalization.logger.enableBuildModes = [];
  await ServiceLocator.setup();
  final cacheStorage = ServiceLocator.instance<CacheStorage>();
  Widget widgetScreen;

  final accessToken = cacheStorage.getData(
    key: CacheKeys.accessToken,
  ) as String?;

  print(accessToken);
  accessToken!=null
      ? widgetScreen = const TabsScreen()
      : widgetScreen = const LoginScreen();


  runApp(EasyLocalization(
    path: AssetsManager.translationsFolder,
    supportedLocales: const [
      Locale('ar'),
      Locale('en'),
    ],
    useOnlyLangCode: true,
    startLocale: const Locale('ar'),
    fallbackLocale: const Locale('ar'),
    child: MyApp(widgetScreen: widgetScreen,),
  ));
}