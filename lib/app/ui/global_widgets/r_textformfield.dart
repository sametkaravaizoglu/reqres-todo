// ignore_for_file: prefer_if_null_operators

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:reqres_app/app/ui/utils/helper.dart';
import '../../../core/init/theme/color_manager.dart';

class RTextFormField {
  static final RTextFormField _instance = RTextFormField._init();
  static RTextFormField get instance => _instance;
  RTextFormField._init();

  Widget widget({
    FocusNode? focusNode,
    required BuildContext context,
    bool? autoFocus,
    String? semantic,
    TextInputAction? textInputAction,
    List<TextInputFormatter>? mask,
    String? Function(String?)? validation,
    VoidCallback? onEditingComplete,
    ValueChanged<String>? onChanged,
    VoidCallback? onTap,
    ValueChanged<String>? onFieldSubmitted,
    TextEditingController? controller,
    TextInputType? keyboardType,
    int? minLines,
    InputBorder? errorBorder,
    InputBorder? focusedErrorBorder,
    InputBorder? border,
    InputBorder? disabledBorder,
    InputDecoration? decoration,
    TextStyle? style,
    TextStyle? labelStyle,
    BoxConstraints? boxConstraints,
    TextStyle? hintStyle,
    TextStyle? errorStyle,
    TextStyle? helperStyle,
    String? hintText,
    String? labelText,
    String? helperText,
    Widget? leadingIcon,
    Widget? suffixIcon,
    bool? obscureText,
    int? maxLength,
    int? maxLines,
    bool? enabled,
    bool? readOnly,
    AutovalidateMode? validateMode,
    double? fontSize,
    Color? borderColor,
    Color? fillColor,
    FloatingLabelBehavior? floatingLabelBehavior,
  }) {
    return TextFormField(
      focusNode: Platform.isIOS ? (focusNode) : null,
      autofocus: autoFocus == null ? false : true,
      enabled: enabled ?? true,
      readOnly: readOnly ?? false,
      cursorColor: ColorManager.instance.black,
      textInputAction: textInputAction,
      style: style != null
          ? style
          : TextStyle(
              color: ColorManager.instance.black,
              fontSize: fontSize,
            ),
      inputFormatters: mask != null ? mask : [],
      textAlignVertical: TextAlignVertical.center,
      obscureText: obscureText ?? false,
      controller: controller,
      onChanged: onChanged,
      onEditingComplete: onEditingComplete,
      onFieldSubmitted: onFieldSubmitted,
      autovalidateMode: validateMode != null ? validateMode : AutovalidateMode.disabled,
      keyboardType: keyboardType ?? TextInputType.text,
      autocorrect: false,
      textCapitalization: TextCapitalization.none,
      maxLines: maxLines ?? 1,
      maxLength: maxLength,
      minLines: minLines ?? 1,
      decoration: decoration ??
          InputDecoration(
            prefixIcon: leadingIcon,
            suffixIcon: suffixIcon,
            constraints: boxConstraints,
            filled: true,
            fillColor: ColorManager.instance.white,
            helperText: helperText,
            helperStyle: helperStyle,
            alignLabelWithHint: true,
            floatingLabelBehavior: floatingLabelBehavior ?? FloatingLabelBehavior.auto,
            labelText: labelText ?? "",
            hintText: hintText ?? "",
            hintStyle: hintStyle != null
                ? hintStyle
                : TextStyle(
                    color: ColorManager.instance.black,
                  ),
            labelStyle: labelStyle ??
                TextStyle(
                  color: ColorManager.instance.black,
                ),
            border: OutlineInputBorder(
              borderRadius: Helper.all20,
              borderSide: BorderSide(color: ColorManager.instance.borderGray, width: Helper.xxs),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: Helper.all20,
              borderSide: BorderSide(color: ColorManager.instance.borderGray, width: Helper.xxs),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: Helper.all20,
              borderSide: BorderSide(color: ColorManager.instance.borderGray, width: Helper.xxs),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: Helper.all20,
              borderSide: BorderSide(color: ColorManager.instance.borderGray, width: Helper.xxs),
            ),
          ),
      validator: validation,
      onTap: onTap,
    );
  }
}
