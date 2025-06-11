import 'package:dartz/dartz.dart';
import 'package:fruits_app/Features/auth/domain/entities/auth_user_entity.dart';
import 'package:fruits_app/core/errors/server_failure.dart';

abstract class AuthRepo {
  Future<Either<ServerFailure, AuthUserEntity>> registerWithEmailAndPassword(
      {required String userName,
      required String email,
      required String password});
  Future<Either<ServerFailure, AuthUserEntity>> loginWithEmailAndPassword(
      {required String email, required String password});
  // Future<Either<ServerFailure, AuthUserEntity>> loginWithFacebook();
  // Future<Either<ServerFailure, AuthUserEntity>> loginWithApple();
  // Future<Either<ServerFailure, AuthUserEntity>> loginWithGoogle();
}
