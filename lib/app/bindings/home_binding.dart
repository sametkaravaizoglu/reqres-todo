
import 'package:get/get.dart';
import '../ui/pages/home_page/controller/home_controller.dart';


class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
  }
}