import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../../../../core/helpers/get_it_singleton_helper.dart';
import '../../../domain/repos/home_service.dart';
import '../../manager/cubits/product_cubit/product_cubit.dart';
import 'home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static const String routeName = "home";
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductCubit(homeService:  getIt.get<HomeService>()),
      child: Scaffold(
        body: HomeViewBody(),
      ),
    );
  }
}
