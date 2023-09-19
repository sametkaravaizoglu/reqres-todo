import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reqres_app/app/ui/global_widgets/loading_widget.dart';
import '../controller/splash_controller.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GetBuilder<SplashController>(
          init: SplashController(),
          builder: (context) {
            return const LoadingOverlayWidget();
          },
        ),
      ),
    );
  }
}
