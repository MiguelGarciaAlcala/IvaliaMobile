import 'package:flutter/material.dart';
import 'package:ivalia_mobile/ui/styles/colors.dart';
import 'package:ivalia_mobile/ui/styles/fonts.dart';

class TextInputField extends TextField {
  TextInputField({
    String? hint, String? errorText, TextEditingController? controller, bool autofocus = false,
    bool obscureText = false, Widget? prefixIcon, Widget? suffixIcon, Key? key
  }) : super(
      key: key,
      controller: controller,
      autofocus: autofocus,
      obscureText: obscureText,
      style: FontStyles.medium.copyWith(color: ColorStyles.darkerGrey),
      decoration: InputDecoration(
          hintText: hint,
          errorText: errorText,
          fillColor: Colors.white,
          filled: true,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: ColorStyles.lightGrey)
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: ColorStyles.lightGrey)
          )
      )
  );
}