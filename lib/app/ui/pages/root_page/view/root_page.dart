import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reqres_app/app/ui/pages/home_page/view/home_page.dart';
import 'package:reqres_app/app/ui/pages/todo_page/todo_page.dart';
import '../controller/root_controller.dart';

class RootPage extends GetView<RootController> {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RootController>(
      init: RootController(),
      builder: (c) {
        return Scaffold(
          body: IndexedStack(
            index: c.pageIndex,
            children: const [
              HomePage(),
              TodoPage(),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            onTap: (value) {
              c.pageIndex = value;
              c.update();
            },
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.task),
                label: 'Todos',
              ),
            ],
          ),
        );
      },
    );
  }
}
