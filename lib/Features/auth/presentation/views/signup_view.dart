import 'package:flutter/material.dart';
import 'package:fruits_app/core/functions/build_app_bar.dart';

import 'widgets/signup_view_body.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});
  static const String routeName = "signup";
  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context,
        text: "حساب جديد",
      ),
      body: SignupViewBody(),
    );
  }
}
