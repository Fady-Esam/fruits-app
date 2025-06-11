import 'package:flutter/material.dart';

import '../../Features/Home/presentation/views/main_view.dart';
import '../../Features/Home/presentation/views/widgets/home_view.dart';
import '../../Features/On_Boarding/presentation/views/on_board_view.dart';
import '../../Features/Splash/presentation/views/splash_view.dart';
import '../../Features/auth/presentation/views/login_view.dart';
import '../../Features/auth/presentation/views/signup_view.dart';
import '../../Features/best_selling_fruits/presentation/views/best_selling_view.dart';

Route<dynamic> onGenerateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case OnBoardView.routeName:
      return MaterialPageRoute(builder: (_) => const OnBoardView());
    case HomeView.routeName:
      return MaterialPageRoute(builder: (_) => const HomeView());
    case MainView.routeName:
      return MaterialPageRoute(builder: (context) => const MainView());
    case LogInView.routeName:
      return MaterialPageRoute(builder: (_) => const LogInView());
    case SignupView.routeName:
      return MaterialPageRoute(builder: (_) => const SignupView());
    case BestSellingView.routeName:
      return MaterialPageRoute(builder: (context) => const BestSellingView());
    default:
      return MaterialPageRoute(builder: (_) => const SplashView());
  }
}