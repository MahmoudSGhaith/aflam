import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/app_styles.dart';


class CustomTextFormField extends StatelessWidget {
  final Color? filledColor;
  final Color? iconColor;
  final Color? borderColor;
  final String? textLabel;
  final String? hintText;
  final TextStyle? hintStyle;
  final Widget? label;
  final TextStyle? labelStyle;
  final Widget? prefixIcon;
  final IconButton? suffixIcon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final bool? isObscureText;
  final bool? isPassword;
  final TextStyle? textStyle;
  final bool? readonly;

  const CustomTextFormField({
    super.key,
    this.filledColor,
    this.borderColor,
    this.hintStyle,
    this.label,
    this.labelStyle,
    this.prefixIcon,
    this.suffixIcon,
    this.controller,
    this.validator,
    this.keyboardType,
    this.isObscureText,
    this.isPassword,
    this.textStyle,
    this.readonly,
    this.textLabel,
    this.hintText,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isObscureText ?? false,
      style: AppStyles.white16medium,
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        labelText: textLabel,
        hintText: hintText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        iconColor: iconColor,
        fillColor: filledColor,
        filled: true,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(100.r)),
      ),
    );
  }
}
