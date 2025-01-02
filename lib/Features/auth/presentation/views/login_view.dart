import 'package:flutter/material.dart';

class LogInView extends StatefulWidget {
  const LogInView({super.key});
  static const String routeName = "login";
  @override
  State<LogInView> createState() => _LogInViewState();
}

class _LogInViewState extends State<LogInView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Text("data"),);
  }
}
