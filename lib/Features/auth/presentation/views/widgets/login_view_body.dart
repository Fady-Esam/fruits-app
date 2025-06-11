import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/Features/auth/presentation/manager/cubits/login_cubit/login_cubit.dart';
import 'package:fruits_app/Features/auth/presentation/views/signup_view.dart';
import 'package:fruits_app/core/classes/app_colors.dart';
import 'package:fruits_app/core/classes/svg_images_handler.dart';
import 'package:fruits_app/core/classes/text_styles.dart';
import 'package:fruits_app/core/widgets/custom_text_form_field.dart';

import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_password_field.dart';
import 'custom_login_button.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  late String email, password;
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              CustomTextFormField(
                hintText: "البريد الالكتروني",
                textInputType: TextInputType.emailAddress,
                onSaved: (value) {
                  email = value!;
                },
              ),
              const SizedBox(height: 20),
              CustomPasswordField(
                onSaved: (value) {
                  password = value!;
                },
              ),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.centerLeft,
                child: GestureDetector(
                  onTap: () {},
                  child: Text(
                    "هل نسيت كلمة المرور؟",
                    textAlign: TextAlign.left,
                    style: TextStyles.semiBold13.copyWith(
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              CustomButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    BlocProvider.of<LoginCubit>(context)
                        .loginUserWithEmailAndPassword(
                      email: email,
                      password: password,
                    );
                  } else {
                    setState(() {
                      autovalidateMode = AutovalidateMode.always;
                    });
                  }
                },
                text: "تسجيل الدخول",
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        SignupView.routeName,
                      );
                    },
                    child: Text(
                      "قم بإنشاء حساب",
                      textAlign: TextAlign.left,
                      style: TextStyles.semiBold16.copyWith(
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                  Text(
                    " لا تمتلك حساب؟",
                    textAlign: TextAlign.left,
                    style: TextStyles.semiBold16.copyWith(
                      color: const Color.fromARGB(255, 116, 115, 115),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Divider(
                      height: 1,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    "أو",
                    style: TextStyles.semiBold16.copyWith(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      height: 1,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              CustomLoginButton(
                image: SvgImagesHandler.googleIcon,
                labelText: "تسجيل دخول باستخدام جوجل",
                onPressed: () async{
                  //await BlocProvider.of<LoginCubit>(context).loginUserWithGoogle();
                },
              ),
              const SizedBox(height: 10),
              CustomLoginButton(
                image: SvgImagesHandler.facebookIcon,
                labelText: "تسجيل دخول باستخدام فيسبوك",
                onPressed: () {},
              ),
              const SizedBox(height: 10),
              CustomLoginButton(
                image: SvgImagesHandler.googleIcon,
                labelText: "تسجيل دخول باستخدام أبل",
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
