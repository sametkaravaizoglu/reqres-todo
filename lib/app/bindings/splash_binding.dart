
import 'package:get/get.dart';
import '../ui/pages/splash_page/controller/splash_controller.dart';


class SplashBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(() => SplashController());
  }
}