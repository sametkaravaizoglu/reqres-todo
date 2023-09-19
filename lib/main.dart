import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:reqres_app/app/bindings/home_binding.dart';
import 'package:reqres_app/app/bindings/login_binding.dart';
import 'package:reqres_app/app/bindings/register_binding.dart';
import 'package:reqres_app/app/bindings/root_binding.dart';
import 'package:reqres_app/app/bindings/splash_binding.dart';
import 'package:reqres_app/app/bindings/todo_binding.dart';
import 'package:reqres_app/app/ui/pages/home_page/view/home_page.dart';
import 'package:reqres_app/app/ui/pages/login_page/view/login_page.dart';
import 'package:reqres_app/app/ui/pages/register_page/view/register_page.dart';
import 'package:reqres_app/app/ui/pages/root_page/view/root_page.dart';
import 'package:reqres_app/app/ui/pages/splash_page/view/splash_page.dart';
import 'package:reqres_app/app/ui/pages/todo_page/todo_page.dart';
import 'package:reqres_app/core/constants/application_constants.dart';
import 'package:reqres_app/core/init/theme/app_theme_light.dart';

import 'app/routes/routes.dart';
import 'core/init/network/network_manager.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await NetworkManager.instance.initManager();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      enableLog: kDebugMode,
      navigatorKey: Get.key,
      logWriterCallback: localLogWriter,
      title: ApplicationConstants.instance.appName,
      theme: AppThemeLight.instance.theme,
      initialRoute: Routes.splash,
      getPages: [
        GetPage(name: Routes.splash, page: () => const SplashPage(), binding: SplashBinding()),
        GetPage(name: Routes.login, page: () => const LoginPage(), binding: LoginBinding()),
        GetPage(name: Routes.register, page: () => const RegisterPage(), binding: RegisterBinding()),
        GetPage(name: Routes.root, page: () => const RootPage(), binding: RootBinding()),
        GetPage(name: Routes.todos, page: () => const TodoPage(), binding: TodoBinding()),
        GetPage(name: Routes.home, page: () => const HomePage(), binding: HomeBinding()),
      ],
      initialBinding: SplashBinding(),
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
