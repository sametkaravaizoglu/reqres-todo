import 'package:flutter/material.dart';
import 'package:reqres_app/app/ui/utils/helper.dart';

import '../../../core/init/theme/color_manager.dart';

class RButtonAsync extends StatefulWidget {
  final String? title;
  final TextStyle? style;
  final Color? borderColor;
  final Color color;
  final Color? disableColor;
  final Color? disableBorderColor;
  final Function onTap;
  final Color? textColor;
  final Widget? icon;
  final double? height;
  final double? fontSize;
  final EdgeInsetsGeometry? padding;
  final double? borderRadius;
  final Widget? rightIcon;

  const RButtonAsync({
    Key? key,
    this.title,
    this.style,
    this.borderColor,
    required this.color,
    required this.onTap,
    this.textColor,
    this.icon,
    this.disableColor,
    this.disableBorderColor,
    this.height,
    this.fontSize,
    this.padding,
    this.borderRadius,
    this.rightIcon,
  }) : super(key: key);

  @override
  State<RButtonAsync> createState() => _RButtonAsyncState();
}

class _RButtonAsyncState extends State<RButtonAsync> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        if (isLoading == false) {
          setState(
            () {
              isLoading = true;
            },
          );
          await widget.onTap();
          setState(
            () {
              isLoading = false;
            },
          );
        }
      },
      child: Container(
        height: Helper.xxxl,
        decoration: BoxDecoration(
          color: (isLoading == true && widget.disableColor != null) ? widget.disableColor : widget.color,
          borderRadius: widget.borderRadius != null ? BorderRadius.circular(widget.borderRadius!) : Helper.all6,
          border: Border.all(
            width: Helper.xs,
            color: (isLoading == true && widget.disableBorderColor != null) ? widget.disableBorderColor! : (widget.borderColor ?? widget.color),
          ),
        ),
        padding: widget.padding ??
            const EdgeInsets.symmetric(
              horizontal: Helper.xl,
            ),
        child: (widget.icon != null || widget.rightIcon != null)
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  widget.icon ?? const SizedBox(),
                  Text(
                    widget.title ?? "",
                    style: widget.style ??
                        TextStyle(
                          color: widget.textColor ?? ColorManager.instance.black,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.normal,
                        ),
                  ),
                  widget.rightIcon ?? const SizedBox()
                ],
              )
            : Center(
                child: isLoading == true
                    ? CircularProgressIndicator.adaptive(
                        backgroundColor: ColorManager.instance.white,
                        valueColor: AlwaysStoppedAnimation<Color>(ColorManager.instance.white),
                      )
                    : Text(
                        widget.title ?? "",
                        style: widget.style ??
                            TextStyle(
                              color: widget.textColor ?? ColorManager.instance.black,
                              fontWeight: FontWeight.w600,
                              fontStyle: FontStyle.normal,
                            ),
                        textAlign: TextAlign.center,
                      ),
              ),
      ),
    );
  }
}
