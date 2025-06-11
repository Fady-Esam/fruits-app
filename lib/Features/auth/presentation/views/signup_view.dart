import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/core/functions/build_app_bar.dart';
import 'package:fruits_app/core/helpers/build_error_message_bar.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../../../../core/helpers/get_it_singleton_helper.dart';

import '../../../Home/presentation/views/widgets/home_view.dart';
import '../../domain/repos/auth_repo.dart';
import '../manager/cubits/signup_cubit/signup_cubit.dart';
import '../manager/cubits/signup_cubit/signup_states.dart';
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
    return BlocProvider(
      create: (context) => SignUpCubit(authRepo: getIt<AuthRepo>()),
      child: Scaffold(
        appBar: buildAppBar(
          context,
          text: "حساب جديد",
        ),
        body: BlocConsumer<SignUpCubit, SignUpState>(
          listener: (context, state) {
            if (state is SignUpFailureState) {
              buildErrorMessageBar(context, state.errMessage);
            } else if (state is SignUpSuccessState) {
              Navigator.pushNamed(
                context,
                HomeView.routeName,
              );
            }
          },
          builder: (context, state) {
            return ModalProgressHUD(
              inAsyncCall: state is SignUpLoadingState,
              child: SignupViewBody(),
            );
          },
        ),
      ),
    );
  }
}
