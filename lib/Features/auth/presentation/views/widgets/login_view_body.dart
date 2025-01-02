import 'package:flutter/material.dart';
import 'package:fruits_app/core/widgets/custom_text_form_field.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          const SizedBox(height: 20),
          CustomTextFormField(
            hintText: "البريد الالكتروني",
            textInputType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 20),
          CustomTextFormField(
            hintText: "كلمة المرور",
            textInputType: TextInputType.visiblePassword,
            prefixIcon: Icon(Icons.remove_red_eye),
          ),
        ],
      ),
    );
  }
}
