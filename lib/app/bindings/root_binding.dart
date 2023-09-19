
import 'package:get/get.dart';
import '../controllers/root_controller.dart';


class RootBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RootController>(() => RootController());
  }
}