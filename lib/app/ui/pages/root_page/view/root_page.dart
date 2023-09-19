import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reqres_app/app/data/enums/preferences_keys.dart';
import 'package:reqres_app/app/ui/global_widgets/r_button.dart';
import 'package:reqres_app/core/init/cache/cache_manager.dart';
import 'package:reqres_app/core/init/theme/color_manager.dart';
import '../../../../routes/routes.dart';
import '../../../utils/helper.dart';
import '../controller/root_controller.dart';

class RootPage extends GetView<RootController> {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RootPage'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(Helper.xl),
          child: Column(
            children: [
              RButton(
                color: ColorManager.instance.white,
                borderColor: ColorManager.instance.black,
                onTap: () async {
                  await CacheManager.instance.setValue(PreferencesKeys.token, null);
                  Get.offAllNamed(Routes.login);
                },
                textColor: ColorManager.instance.black,
                title: "Logout",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
