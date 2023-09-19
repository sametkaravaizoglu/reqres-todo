
import 'package:get/get.dart';
import '../controllers/todo_controller.dart';


class TodoBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TodoController>(() => TodoController());
  }
}