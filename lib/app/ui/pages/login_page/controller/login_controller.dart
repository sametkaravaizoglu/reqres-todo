import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reqres_app/app/data/models/user_model.dart';
import 'package:reqres_app/app/data/services/services.dart';

import '../../../../../core/init/cache/cache_manager.dart';
import '../../../../data/enums/preferences_keys.dart';
import '../../../../routes/routes.dart';

class LoginController extends GetxController {
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  login() async {
    var data = await ServiceManager.instance.login(emailTextEditingController.text, passwordTextEditingController.text);
    if (data is Map) {
      if (data["statusCode"] == 200) {
        UserModel userModel = UserModel.fromJson(data);
        await CacheManager.instance.setValue(PreferencesKeys.token, userModel.token);
        Get.offAllNamed(Routes.root);
      } else {
        Get.rawSnackbar(title: "Error", message: "${data["error"]}");
      }
    }
  }

  @override
  void onClose() {
    emailTextEditingController.dispose();
    passwordTextEditingController.dispose();
    super.onClose();
  }
}
