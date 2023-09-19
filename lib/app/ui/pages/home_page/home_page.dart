import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reqres_app/app/ui/utils/helper.dart';
import 'package:reqres_app/core/init/theme/color_manager.dart';
import '../../../controllers/home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (c) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('HomePage'),
              actions: [
                IconButton(
                  onPressed: () async {
                    await c.logout();
                  },
                  icon: Icon(
                    Icons.logout,
                    color: ColorManager.instance.white,
                  ),
                ),
              ],
            ),
            body: Padding(
                padding: const EdgeInsets.only(
                  left: Helper.xl,
                  right: Helper.xl,
                  top: Helper.xl,
                ),
                child: ListView.separated(
                  shrinkWrap: true,
                  controller: c.scrollController,
                  physics: const BouncingScrollPhysics(),
                  itemCount: c.usersModel?.data?.length ?? 0,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: ClipRRect(
                        borderRadius: Helper.all6,
                        child: Image.network(
                          c.usersModel?.data?[index].avatar ?? "",
                          height: 60,
                          width: 60,
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: Text(
                        "${c.usersModel?.data?[index].firstName ?? ""} ${c.usersModel?.data?[index].lastName ?? ""}",
                      ),
                      subtitle: Text(
                        "${c.usersModel?.data?[index].email ?? ""} ",
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => const Divider(),
                )),
          );
        });
  }
}
