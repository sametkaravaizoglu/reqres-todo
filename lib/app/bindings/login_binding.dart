
import 'package:get/get.dart';
import '../ui/pages/login_page/controller/login_controller.dart';


class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
  }
}