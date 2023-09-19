import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reqres_app/app/ui/utils/helper.dart';

import '../../../core/init/theme/color_manager.dart';

class KBottomSheet {
  static Future show({
    required Widget content,
    Color? bottomSheetColor,
    String? title,
    required BuildContext context,
    bool? withoutHeader,
    isDismissible,
    Function? whenComplete,
  }) {
    return showModalBottomSheet(
      context: context,
      isDismissible: isDismissible ?? true,
      isScrollControlled: true,
      useRootNavigator: true,
      constraints: BoxConstraints(
        maxHeight: Get.height * 0.9,
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      backgroundColor: bottomSheetColor ?? ColorManager.instance.white,
      builder: (context) {
        return Padding(
          padding: MediaQuery.viewInsetsOf(context),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(
                left: Helper.xl,
                right: Helper.xl,
                top: Helper.xl,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  withoutHeader != true
                      ? Padding(
                          padding: const EdgeInsets.only(
                            bottom: Helper.xl,
                          ),
                          child: SizedBox(
                            height: Helper.xxl,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Text(
                                    title ?? "",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: ColorManager.instance.darkGray,
                                    ),
                                  ),
                                ),
                                const CloseIconForBottomSheet(),
                              ],
                            ),
                          ),
                        )
                      : const SizedBox(),
                  Flexible(child: content),
                ],
              ),
            ),
          ),
        );
      },
    )..whenComplete(
        () {
          if (whenComplete != null) {
            whenComplete();
          }
        },
      );
  }
}

class CloseIconForBottomSheet extends StatelessWidget {
  final Color? closeIconColor;
  const CloseIconForBottomSheet({
    Key? key,
    this.closeIconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        width: Helper.xxl,
        height: Helper.xxl,
        decoration: BoxDecoration(
          border: Border.all(
            color: ColorManager.instance.borderGray,
          ),
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Icon(
            Icons.close,
            size: 21,
            color: closeIconColor ?? ColorManager.instance.darkGray,
          ),
        ),
      ),
    );
  }
}
