import 'package:flutter/material.dart';

Widget buildTextField({
  TextEditingController? controller,
  required String label,
  bool obscureText = false,
  IconButton? suffixIcon,
  Function? validator,
  BorderSide borderSide = const BorderSide(color: Colors.blue, width: 2),
  Color fontColor = Colors.black,
  FontWeight fontWeight = FontWeight.normal,
}) {
  return TextField(
    controller: controller,
    decoration: InputDecoration(
      focusedBorder: OutlineInputBorder(borderSide: borderSide),
      labelText: label,
      labelStyle: TextStyle(color: fontColor, fontWeight: fontWeight),
      suffixIcon: suffixIcon,
    ),
  );
}
