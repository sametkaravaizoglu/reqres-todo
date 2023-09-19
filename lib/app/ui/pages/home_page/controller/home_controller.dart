import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reqres_app/app/data/enums/preferences_keys.dart';
import 'package:reqres_app/app/data/services/services.dart';
import 'package:reqres_app/app/routes/routes.dart';
import 'package:reqres_app/app/ui/pages/root_page/model/users_model.dart';
import 'package:reqres_app/core/init/cache/cache_manager.dart';

class HomeController extends GetxController {
  ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    scrollController = ScrollController()..addListener(_scrollListener);
    getUsers();
    super.onInit();
  }

  @override
  void onClose() {
    scrollController.removeListener(_scrollListener);
    super.onClose();
  }

  void _scrollListener() {
    if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
      getMoreUsers();
    }
  }

  UsersModel? usersModel;
  int page = 1;

  getUsers() async {
    usersModel = await ServiceManager.instance.getUsers(page);
    //for more users
    getMoreUsers();
    update();
  }

  getMoreUsers() async {
    page = page + 1;
    if (usersModel == null) {
      return;
    }

    if (usersModel?.totalPages == null) {
      return;
    }

    if (usersModel!.totalPages! < page) {
      return;
    } else {
      UsersModel? moreUsersModel = await ServiceManager.instance.getUsers(page);

      moreUsersModel?.data?.forEach(
        (element) {
          usersModel?.data?.add(element);
        },
      );
      update();
    }
  }

  logout() async {
    await CacheManager.instance.setValue(PreferencesKeys.token, null);
    Get.offAllNamed(Routes.login);
  }
}
