import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/Features/auth/presentation/manager/cubits/signup_cubit/signup_cubit.dart';
import 'package:fruits_app/Features/auth/presentation/views/login_view.dart';
import 'package:fruits_app/core/helpers/build_error_message_bar.dart';
import 'package:fruits_app/core/widgets/custom_text_form_field.dart';
import '../../../../../core/classes/app_colors.dart';
import '../../../../../core/classes/text_styles.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_password_field.dart';
import 'terms_and_conditions.dart';

class SignupViewBody extends StatefulWidget {
  const SignupViewBody({super.key});

  @override
  State<SignupViewBody> createState() => _SignupViewBodyState();
}

class _SignupViewBodyState extends State<SignupViewBody> {
  late String userName, email, password;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isTermsAndConditionsChecked = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Form(
        key: formKey,
        autovalidateMode: autovalidateMode,
        child: Column(
          children: [
            const SizedBox(height: 20),
            CustomTextFormField(
              hintText: "الاسم كامل",
              textInputType: TextInputType.name,
              onSaved: (value) {
                userName = value!;
              },
            ),
            const SizedBox(height: 20),
            CustomTextFormField(
              hintText: "البريد الالكتروني",
              textInputType: TextInputType.emailAddress,
              onSaved: (value) {
                email = value!;
              },
            ),
            const SizedBox(height: 20),
            CustomPasswordField(onSaved: (value) {
                password = value!;

            }),
            const SizedBox(height: 20),
            TermsAndConditions(
              onChangedFunc: (value) {
                isTermsAndConditionsChecked = value ?? false;
              },
            ),
            const SizedBox(height: 20),
            CustomButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  if (!isTermsAndConditionsChecked) {
                    buildErrorMessageBar(
                        context, "You Must Accept Terms and Conditions");
                    return;
                  }
                  formKey.currentState!.save();
                  BlocProvider.of<SignUpCubit>(context)
                      .createUserWithEmailAndPassword(
                        userName: userName,
                    email: email,
                    password: password,
                  );
                } else {
                  setState(() {
                    autovalidateMode = AutovalidateMode.always;
                  });
                }
              },
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
      ),
    );
  }
}

