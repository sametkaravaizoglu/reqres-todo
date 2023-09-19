
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/todo_controller.dart';


class TodoPage extends GetView<TodoController> {
  const TodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TodoPage'),
      ),
      body: SafeArea(
        child: Text('TodoController'),
      ),
    );
  }
}
  