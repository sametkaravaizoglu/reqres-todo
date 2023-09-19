import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reqres_app/app/data/enums/preferences_keys.dart';
import 'package:reqres_app/core/init/locale_manager/locale_manager.dart';

import '../model/todo_model.dart';

class TodoController extends GetxController {
  TextEditingController titleTextEditingController = TextEditingController();
  TextEditingController descriptionTextEditingController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  List<Todo> todos = [];

  @override
  void onInit() {
    getTodos();
    super.onInit();
  }

  getTodos() {
    var localeTodos = LocaleManager.instance.getValue(PreferencesKeys.todos);
    if (localeTodos != null) {
      todos = List.generate(
        localeTodos.length,
        (index) => Todo.fromJson(localeTodos[index]),
      );
    }
    updateTodoList();
  }

  addTodo({required String title, required String description}) {
    final DateTime now = DateTime.now();
    String uuid = now.microsecondsSinceEpoch.toString();

    Todo todo = Todo(uuid: uuid, title: title, description: description);
    todos.add(todo);
    updateTodoList();
  }

  removeTodo(int index) {
    todos.removeAt(index);
    updateTodoList();
  }

  updateTodoList() {
    LocaleManager.instance.setValue(PreferencesKeys.todos, todos);
    update();
  }

  @override
  void onClose() {
    titleTextEditingController.dispose();
    descriptionTextEditingController.dispose();
    super.onClose();
  }
}
