import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reqres_app/app/ui/global_widgets/r_textformfield.dart';
import 'package:reqres_app/app/ui/utils/helper.dart';
import 'package:reqres_app/app/ui/utils/validators.dart';
import '../../../../../core/init/theme/color_manager.dart';
import '../../../../routes/routes.dart';
import '../../../global_widgets/r_button_async.dart';
import '../controller/register_controller.dart';

class RegisterPage extends GetView<RegisterController> {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: GetBuilder<RegisterController>(
              init: RegisterController(),
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
                          title: "Register",
                          onTap: () async {
                            await c.register();
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: Helper.xl),
                          child: RButtonAsync(
                            color: ColorManager.instance.white,
                            textColor: ColorManager.instance.black,
                            borderColor: ColorManager.instance.black,
                            title: "Login",
                            onTap: () async {
                              Get.offAllNamed(Routes.login);
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
