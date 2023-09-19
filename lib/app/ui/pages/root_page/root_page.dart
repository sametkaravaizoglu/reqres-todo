import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/root_controller.dart';

class RootPage extends GetView<RootController> {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RootPage'),
      ),
      body: SafeArea(
        child: Text('RootController'),
      ),
    );
  }
}
