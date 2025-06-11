import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/Features/Home/presentation/views/widgets/home_view.dart';

import 'package:fruits_app/Features/auth/presentation/manager/cubits/login_cubit/login_cubit.dart';
import 'package:fruits_app/Features/auth/presentation/manager/cubits/login_cubit/login_states.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../core/functions/build_app_bar.dart';
import '../../../../core/helpers/build_error_message_bar.dart';
import '../../../../core/helpers/get_it_singleton_helper.dart';
import '../../domain/repos/auth_repo.dart';
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
    return BlocProvider(
      create: (context) => LoginCubit(authRepo: getIt<AuthRepo>()),
      child: Scaffold(
        appBar: buildAppBar(context, text: "تسجيل الدخول"),
        body: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state is LoginFailureState) {
              buildErrorMessageBar(context, state.errMessage);
            } else if (state is LoginSuccessState) {
              Navigator.pushNamed(context, HomeView.routeName);
            }
          },
          builder: (context, state) {
            return ModalProgressHUD(
              inAsyncCall: state is LoginLoadingState,
              child: LoginViewBody(),
            );
          },
        ),
      ),
    );
  }
}
