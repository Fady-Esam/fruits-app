import 'package:flutter/material.dart';

import 'widgets/on_board_view_body.dart';

class OnBoardView extends StatefulWidget {
  const OnBoardView({super.key});
  static const String routeName = "";
  @override
  State<OnBoardView> createState() => _OnBoardViewState();
}

class _OnBoardViewState extends State<OnBoardView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const OnBoardViewBody(),
    );
  }
}
