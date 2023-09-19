import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reqres_app/app/ui/global_widgets/r_button.dart';
import 'package:reqres_app/app/ui/global_widgets/r_textformfield.dart';
import 'package:reqres_app/app/ui/utils/helper.dart';
import 'package:reqres_app/app/ui/utils/validators.dart';
import 'package:reqres_app/core/init/theme/color_manager.dart';
import '../../global_widgets/r_bottom_sheet_wigdet.dart';
import 'controller/todo_controller.dart';

class TodoPage extends GetView<TodoController> {
  const TodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TodoController>(
      init: TodoController(),
      builder: (c) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('TodoPage'),
          ),
          body: SafeArea(
            child: ListView.builder(
              itemCount: c.todos.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(c.todos[index].title ?? ""),
                  subtitle: Text(c.todos[index].description ?? ""),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      c.removeTodo(index);
                    },
                  ),
                );
              },
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              KBottomSheet.show(
                content: GetBuilder<TodoController>(
                  builder: (c) {
                    return Form(
                      key: c.formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          RTextFormField.instance.widget(
                            context: context,
                            controller: c.titleTextEditingController,
                            validation: ValidatorManager.defaultEmptyCheckValidator,
                            labelText: "Title",
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: Helper.xl),
                            child: RTextFormField.instance.widget(
                              context: context,
                              controller: c.descriptionTextEditingController,
                              validation: ValidatorManager.defaultEmptyCheckValidator,
                              maxLines: 5,
                              labelText: "Description",
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: Helper.xxl),
                            child: RButton(
                              color: ColorManager.instance.black,
                              title: "Save",
                              textColor: ColorManager.instance.white,
                              onTap: () {
                                if (c.formKey.currentState!.validate()) {
                                  c.addTodo(title: c.titleTextEditingController.text, description: c.descriptionTextEditingController.text);
                                  Get.back();
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                context: context,
                whenComplete: () {
                  c.titleTextEditingController.clear();
                  c.descriptionTextEditingController.clear();
                },
              );
            },
            backgroundColor: ColorManager.instance.black,
            child: Icon(
              Icons.add,
              color: ColorManager.instance.white,
            ),
          ),
        );
      },
    );
  }
}
