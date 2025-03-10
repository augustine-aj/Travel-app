import 'package:flutter/material.dart';

Widget buildTextFormField({
  TextEditingController? controller,
  required String label,
  bool obscureText = false,
  IconButton? suffixIcon,
  Icon? prefixIcon,
  BorderSide borderSide = const BorderSide(color: Colors.blue, width: 2),
  Color fontColor = Colors.black,
  FontWeight fontWeight = FontWeight.normal,
  String? Function(String?)? validator,
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled,
  // Validator function
}) {
  return TextFormField(
    controller: controller,
    obscureText: obscureText,
    decoration: InputDecoration(
      suffixIcon: suffixIcon,
      prefixIcon: prefixIcon,
      focusedBorder: OutlineInputBorder(borderSide: borderSide),
      labelText: label,
      labelStyle: TextStyle(color: fontColor, fontWeight: fontWeight),
    ),
    validator: validator,
    autovalidateMode: autoValidateMode,
  );
}
