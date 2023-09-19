
import 'package:get/get.dart';
import '../ui/pages/register_page/controller/register_controller.dart';


class RegisterBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterController>(() => RegisterController());
  }
}