
import '../../../../domain/entities/auth_user_entity.dart';

class LoginState {}

class InitialLoginState extends LoginState {}

class LoginFailureState extends LoginState {
  final String errMessage;
  LoginFailureState({required this.errMessage});
}

class LoginSuccessState extends LoginState {
  final AuthUserEntity loginUserEntity;

  LoginSuccessState({required this.loginUserEntity});
}

class LoginLoadingState extends LoginState {}
