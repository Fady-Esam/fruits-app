

import '../../../../domain/entities/auth_user_entity.dart';

class SignUpState {}

class InitialSignUpState extends SignUpState {}

class SignUpFailureState extends SignUpState {
  final String errMessage;
  SignUpFailureState({required this.errMessage});
}

class SignUpSuccessState extends SignUpState {
    final AuthUserEntity signUpUserEntity;

  SignUpSuccessState({required this.signUpUserEntity});
}

class SignUpLoadingState extends SignUpState {

}


