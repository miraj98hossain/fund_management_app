import 'package:flutter/material.dart';
import 'package:fund_management_app/theme/theme_helper.dart';

class CommonTextFieldWidget extends StatelessWidget {
  const CommonTextFieldWidget({
    super.key,
    required this.hintText,
    this.suffix,
    this.keyboardType,
    this.obscureText = false,
    this.controller,
    this.focusNode,
    this.validator,
  });
  final String? hintText;
  final Widget? suffix;
  final TextInputType? keyboardType;
  final bool obscureText;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      enableSuggestions: false,
      autocorrect: false,
      keyboardType: keyboardType ?? TextInputType.text,
      obscureText: obscureText,
      cursorColor: appTheme.primary,
      textAlign: TextAlign.left,
      textAlignVertical: TextAlignVertical.center,
      style: textTheme.bodySmall!.copyWith(
        color: appTheme.primary,
        fontWeight: FontWeight.w400,
        decoration: TextDecoration.none,
      ),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: textTheme.bodySmall!.copyWith(
          color: appTheme.primary,
          fontWeight: FontWeight.w400,
        ),
        suffixIcon: suffix ?? const SizedBox(),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: appTheme.primary,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: appTheme.primary,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: appTheme.primary,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: appTheme.red,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: appTheme.primary.withOpacity(0.5),
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: appTheme.red,
          ),
        ),
        errorStyle: textTheme.bodySmall!.copyWith(
          color: appTheme.red,
          fontWeight: FontWeight.w400,
          decoration: TextDecoration.none,
        ),
      ),
      validator: validator,
    );
  }
}
//  height: 48,
//       width: double.infinity,
//       padding: const EdgeInsets.only(left: 20),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(10),
//         border: Border.all(color: appTheme.primary),
//       ),