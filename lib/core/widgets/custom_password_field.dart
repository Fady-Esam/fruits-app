import 'package:flutter/material.dart';

import 'custom_text_form_field.dart';

class CustomPasswordField extends StatefulWidget {
  const CustomPasswordField({
    super.key,
    this.onSaved,
  });
  final void Function(String?)? onSaved;

  @override
  State<CustomPasswordField> createState() => _CustomPasswordFieldState();
}

class _CustomPasswordFieldState extends State<CustomPasswordField> {
  bool isSeen = false;
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      hintText: "كلمة المرور",
      isObsecure: !isSeen,
      textInputType: TextInputType.visiblePassword,
      prefixIcon: IconButton(
        onPressed: () {
          setState(() {
            isSeen = !isSeen;
          });
        },
        icon: isSeen
            ? Icon(
                Icons.remove_red_eye,
              )
            : Icon(
                Icons.visibility_off,
              ),
      ),
      onSaved: widget.onSaved,
    );
  }
}
