
import 'package:get/get.dart';
import '../ui/pages/root_page/controller/root_controller.dart';


class RootBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RootController>(() => RootController());
  }
}