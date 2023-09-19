import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reqres_app/app/bindings/root_binding.dart';
import 'package:reqres_app/app/ui/pages/root_page/root_page.dart';
import 'package:reqres_app/core/constants/application_constants.dart';
import 'package:reqres_app/core/init/theme/app_theme_light.dart';

import 'core/init/network/network_manager.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NetworkManager.instance.initManager();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      enableLog: true,
      navigatorKey: Get.key,
      logWriterCallback: localLogWriter,
      title: ApplicationConstants.instance.appName,
      theme: AppThemeLight.instance.theme,
      initialRoute: "/root",
      getPages: [
        GetPage(name: "/root", page: () => const RootPage(), binding: RootBinding()),
      ],
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.cupertino,
      opaqueRoute: Get.isOpaqueRouteDefault,
      popGesture: Get.isPopGestureEnable,
      transitionDuration: Get.defaultTransitionDuration,
    );
  }

  void localLogWriter(String text, {bool? isError}) {
    if (kDebugMode) {
      debugPrint(text);
    }
  }
}
