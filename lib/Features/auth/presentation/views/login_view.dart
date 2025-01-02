import 'package:flutter/material.dart';
import 'package:fruits_app/core/classes/text_styles.dart';

import '../../../../core/functions/build_app_bar.dart';
import 'widgets/login_view_body.dart';

class LogInView extends StatefulWidget {
  const LogInView({super.key});
  static const String routeName = "login";
  @override
  State<LogInView> createState() => _LogInViewState();
}

class _LogInViewState extends State<LogInView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, text: "تسجيل الدخول"),
      body: LoginViewBody(),
    );
  }
}

