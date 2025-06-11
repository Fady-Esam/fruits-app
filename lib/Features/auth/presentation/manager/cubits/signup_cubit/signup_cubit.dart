import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/Features/auth/domain/repos/auth_repo.dart';
import 'package:fruits_app/Features/auth/presentation/manager/cubits/signup_cubit/signup_states.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit({required this.authRepo}) : super(InitialSignUpState());
  final AuthRepo authRepo;
  Future<void> createUserWithEmailAndPassword(
      {required String email, required String password, required String userName}) async {
    emit(SignUpLoadingState());
    var res = await authRepo.registerWithEmailAndPassword(
        userName: userName, email: email, password: password);
    res.fold((fail) => emit(SignUpFailureState(errMessage: fail.errMessage)),
        (user) => emit(SignUpSuccessState(signUpUserEntity: user)));
  }
}
