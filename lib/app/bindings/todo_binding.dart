
import 'package:get/get.dart';
import '../ui/pages/todo_page/controller/todo_controller.dart';


class TodoBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TodoController>(() => TodoController());
  }
}