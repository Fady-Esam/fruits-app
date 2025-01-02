import 'package:flutter/material.dart';
import 'package:fruits_app/Features/auth/presentation/views/login_view.dart';
import 'package:fruits_app/core/widgets/custom_text_form_field.dart';

import '../../../../../core/classes/app_colors.dart';
import '../../../../../core/classes/text_styles.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../signup_view.dart';
import 'terms_and_conditions.dart';

class SignupViewBody extends StatefulWidget {
  const SignupViewBody({super.key});

  @override
  State<SignupViewBody> createState() => _SignupViewBodyState();
}

class _SignupViewBodyState extends State<SignupViewBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          const SizedBox(height: 20),
          CustomTextFormField(
            hintText: "الاسم كامل",
            textInputType: TextInputType.name,
          ),
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
          const SizedBox(height: 20),
          TermsAndConditions(),
          const SizedBox(height: 20),
          CustomButton(
            onPressed: () {},
            text: "انشاء حساب جديد",
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacementNamed(
                    context,
                    LogInView.routeName,
                  );
                },
                child: Text(
                  "تسجيل الدخول",
                  textAlign: TextAlign.left,
                  style: TextStyles.semiBold16.copyWith(
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
              Text(
                "تمتلك حساب بالفعل؟",
                textAlign: TextAlign.left,
                style: TextStyles.semiBold16.copyWith(
                  color: const Color.fromARGB(255, 116, 115, 115),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
