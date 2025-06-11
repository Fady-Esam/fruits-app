import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/repos/auth_repo.dart';
import 'login_states.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.authRepo}) : super(InitialLoginState());
  final AuthRepo authRepo;
  Future<void> loginUserWithEmailAndPassword(
      {required String email, required String password}) async {
    emit(LoginLoadingState());
    var res = await authRepo.loginWithEmailAndPassword(
        email: email, password: password);
    res.fold((fail) => emit(LoginFailureState(errMessage: fail.errMessage)),
        (user) => emit(LoginSuccessState(loginUserEntity: user)));
  }
}
/*
  Future<void> loginUserWithGoogle(
      ) async {
    emit(LoginLoadingState());
    var res = await authRepo.loginWithGoogle();
    res.fold((fail) => emit(LoginFailureState(errMessage: fail.errMessage)),
        (user) => emit(LoginSuccessState(loginUserEntity: user)));
  }
  Future<void> loginWithFacebook(
      ) async {
    emit(LoginLoadingState());
    var res = await authRepo.loginWithFacebook();
    res.fold((fail) => emit(LoginFailureState(errMessage: fail.errMessage)),
        (user) => emit(LoginSuccessState(loginUserEntity: user)));
  }
  Future<void> loginUserWithApple(
      ) async {
    emit(LoginLoadingState());
    var res = await authRepo.loginWithApple();
    res.fold((fail) => emit(LoginFailureState(errMessage: fail.errMessage)),
        (user) => emit(LoginSuccessState(loginUserEntity: user)));
  }
}
*/
