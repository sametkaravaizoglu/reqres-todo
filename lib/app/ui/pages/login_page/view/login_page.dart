import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reqres_app/app/ui/global_widgets/r_button_async.dart';
import 'package:reqres_app/app/ui/global_widgets/r_textformfield.dart';
import 'package:reqres_app/app/ui/utils/helper.dart';
import 'package:reqres_app/app/ui/utils/validators.dart';
import 'package:reqres_app/core/init/theme/color_manager.dart';
import '../../../../routes/routes.dart';
import '../controller/login_controller.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: GetBuilder<LoginController>(
              init: LoginController(),
              builder: (c) {
                return Form(
                  key: c.formKey,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: Helper.xl),
                    child: Column(
                      children: [
                        RTextFormField.instance.widget(
                          context: context,
                          labelText: "E-mail",
                          controller: c.emailTextEditingController,
                          validation: ValidatorManager.defaultEmptyCheckValidator,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: Helper.xl),
                          child: RTextFormField.instance.widget(
                            context: context,
                            labelText: "Password",
                            controller: c.passwordTextEditingController,
                            validation: ValidatorManager.defaultEmptyCheckValidator,
                          ),
                        ),
                        RButtonAsync(
                          color: ColorManager.instance.black,
                          textColor: ColorManager.instance.white,
                          title: "Login",
                          onTap: () async {
                            await c.login();
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: Helper.xl),
                          child: RButtonAsync(
                            color: ColorManager.instance.white,
                            textColor: ColorManager.instance.black,
                            borderColor: ColorManager.instance.black,
                            title: "Register",
                            onTap: () async {
                              Get.offAllNamed(Routes.register);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
