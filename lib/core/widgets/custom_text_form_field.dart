import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.textInputType,
    this.prefixIcon,
    this.onSaved,
    this.isObsecure = false,
  });
  final String hintText;
  final TextInputType textInputType;
  final Widget? prefixIcon;
  final bool isObsecure;
  final void Function(String?)? onSaved;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.trim().isEmpty) return "هذا الحقل مطلوب";
        return null;
      },
      textAlign: TextAlign.right,
      obscureText: isObsecure,
      onSaved: onSaved,
      keyboardType: textInputType,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: prefixIcon,
        hintTextDirection: TextDirection.rtl,
        hintStyle: TextStyle(
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 94, 110, 110),
        ),
        filled: true,
        fillColor: Color.fromARGB(255, 253, 255, 255),
        border: buildBorder(width: 2),
        enabledBorder: buildBorder(width: 2),
        focusedBorder: buildBorder(width: 3),
      ),
    );
  }

  OutlineInputBorder buildBorder({required double width}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: BorderSide(
        color: Color.fromARGB(255, 80, 92, 92),
        width: width,
      ),
    );
  }
}
