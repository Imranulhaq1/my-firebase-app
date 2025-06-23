import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String? hintText;
  final String? labelText;
  final bool? enabled;
  final bool? obscureText;
  final Color? fillColor;
  final BorderSide? enabledBorderSide;
  final Widget? prefixIcon;
  final Color? borderColor;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final int? maxLines;
  final String? errorText;

  const CustomTextField({
    super.key,
    this.maxLines,
    this.hintText,
    this.labelText,
    this.enabled,
    this.obscureText,
    this.fillColor,
    this.enabledBorderSide,
    this.prefixIcon,
    this.suffixIcon,
    this.controller,
    this.keyboardType,
    this.borderColor,
    this.errorText, // ✅ Add this to the constructor
  });

  @override
  Widget build(BuildContext context) {
    final Color effectiveBorderColor = borderColor ?? Colors.white;

    return TextField(
      controller: controller,
      enabled: enabled,
      maxLines: maxLines ?? 1,
      obscureText: obscureText ?? false,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        labelText: labelText,
        hintText: hintText,
        errorText: errorText, // ✅ Use it here to show error
        filled: fillColor != null,
        fillColor: fillColor,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(color: effectiveBorderColor, width: 2),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    );
  }
}
