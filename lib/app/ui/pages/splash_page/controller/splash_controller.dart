import 'package:get/get.dart';
import '../../../../../core/init/cache/cache_manager.dart';
import '../../../../data/enums/preferences_keys.dart';
import '../../../../routes/routes.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    getInitialData();
    super.onInit();
  }

  getInitialData() async {
    String? token = await CacheManager.instance.getValue(PreferencesKeys.token);
    if (token == null) {
      return Get.offAllNamed(Routes.login);
    }
    return Get.offAllNamed(Routes.root);
  }
}
