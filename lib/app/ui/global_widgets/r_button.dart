import 'package:flutter/material.dart';

import '../../../core/init/theme/color_manager.dart';
import '../utils/helper.dart';

class RButton extends StatelessWidget {
  final String? title;
  final TextStyle? style;
  final Color? borderColor;
  final Color color;
  final Function onTap;
  final Color? textColor;
  final Widget? icon;
  final double? height;
  final double? fontSize;
  final EdgeInsetsGeometry? padding;
  final double? borderRadius;
  final Widget? rightIcon;

  const RButton({
    Key? key,
    this.title,
    this.style,
    this.borderColor,
    required this.color,
    required this.onTap,
    this.textColor,
    this.icon,
    this.height,
    this.fontSize,
    this.padding,
    this.borderRadius,
    this.rightIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      child: Container(
        height: Helper.xxxl,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(borderRadius ?? 6),
          border: Border.all(
            width: Helper.xs,
            color: borderColor ?? color,
          ),
        ),
        padding: padding ??
            const EdgeInsets.symmetric(
              horizontal: Helper.xl,
            ),
        child: (icon != null || rightIcon != null)
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  icon ?? const SizedBox(),
                  Text(
                    title ?? "",
                    style: style ??
                        TextStyle(
                          color: textColor ?? ColorManager.instance.darkGray,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.normal,
                        ),
                  ),
                  rightIcon ?? const SizedBox()
                ],
              )
            : Center(
                child: Text(
                  title ?? "",
                  style: style ??
                      TextStyle(
                        color: textColor ?? ColorManager.instance.darkGray,
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
