import 'package:flutter/material.dart';

import '../../Features/On_Boarding/presentation/views/on_board_view.dart';
import '../../Features/Splash/presentation/views/splash_view.dart';
import '../../Features/auth/presentation/views/login_view.dart';

Route<dynamic> onGenerateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case OnBoardView.routeName:
      return MaterialPageRoute(builder: (_) => const OnBoardView());
    case LogInView.routeName:
      return MaterialPageRoute(builder: (_) => const LogInView());
    default:
      return MaterialPageRoute(builder: (_) => const SplashView());
  }
}