import 'dart:convert';
import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:fruits_app/Features/auth/domain/entities/auth_user_entity.dart';
import 'package:fruits_app/Features/auth/domain/repos/auth_repo.dart';
import 'package:fruits_app/core/errors/server_failure.dart';
import 'package:fruits_app/core/services/api_service.dart';

import '../../../../core/helpers/token_storage.dart';
// import 'package:sign_in_with_apple/sign_in_with_apple.dart';
// import 'package:http/http.dart' as http;
// import 'package:http/http.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:sign_in_with_apple/sign_in_with_apple.dart';
// import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class AuthRepoImp implements AuthRepo {
  final ApiService apiService;

  AuthRepoImp({required this.apiService});
  @override
  Future<Either<ServerFailure, AuthUserEntity>> registerWithEmailAndPassword({
    required String userName,
    required String email,
    required String password,
  }) async {
    try {
      var result = await apiService.post(
        endPoint: "api/Auth/register",
        body: {
          "userName": userName,
          "email": email,
          "password": password,
        },
      );
      var resultData = jsonDecode(result.body);
      log("Result ${resultData.toString()}");
      if (result.statusCode >= 400) {
        Map<String, dynamic> errors = resultData["errors"];
        return left(
            ServerFailure(errMessage: errors.values.toList().join("\n")));
      }
      await TokenStorage.storeToken(resultData["data"]["token"]);
      return right(
        AuthUserEntity(
          email: resultData["data"]["email"],
          name: resultData["data"]["userName"],
          id: resultData["data"]["userId"],
          token: resultData["data"]["token"],
        ),
      );
    } catch (e) {
      return left(
          ServerFailure(errMessage: "Something went wrong, please try again."));
    }
  }

  @override
  Future<Either<ServerFailure, AuthUserEntity>> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {

    try {
      var result = await apiService.post(
        endPoint: "api/Auth/log-in",
        body: {
          "email": email,
          "password": password,
        },
      );
      var resultData = jsonDecode(result.body);
      log("Result ${resultData.toString()}");
      if (result.statusCode >= 400) {
        Map<String, dynamic> errors = resultData["errors"];
        return left(
            ServerFailure(errMessage: errors.values.toList().join("\n")));
      }
      await TokenStorage.storeToken(resultData["data"]["token"]);
      return right(
        AuthUserEntity(
          email: resultData["data"]["email"],
          name: resultData["data"]["userName"],
          id: resultData["data"]["userId"],
          token: resultData["data"]["token"],
        ),
      );
    } catch (e) {
      return left(
          ServerFailure(errMessage: "Something went wrong, please try again."));
    }
  }
}
/*
  @override
  Future<Either<ServerFailure, AuthUserEntity>> loginWithApple() async {
    try {
      final credential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );

      final idToken = credential.identityToken;

      // Send idToken to your ASP.NET Core backend
      final String userName = '${credential.givenName} ${credential.familyName}'; 
      var response = await apiService.post(
        endPoint: "api/Auth/log-in-with-apple",
        body: {
          'idToken': idToken,
        },
      );



      var resultData = jsonDecode(response.body);
      if (resultData.statusCode >= 400) {
        Map<String, dynamic> errors = resultData["errors"];
        return left(
            ServerFailure(errMessage: errors.values.toList().join("\n")));
      }
      return right(
        AuthUserEntity(
          email: resultData["data"]["email"],
          name: userName,
          id: resultData["data"]["userId"],
          token: resultData["data"]["token"],
        ),
      );
    } catch (e) {
      return left(
          ServerFailure(errMessage: "Something went wrong, please try again."));
    }
  }

  @override
  Future<Either<ServerFailure, AuthUserEntity>> loginWithFacebook() async {
    try {
      final result = await FacebookAuth.instance.login();
      if (result.status != LoginStatus.success) {
        return left(ServerFailure(errMessage: ""));
      }

      final userData = await FacebookAuth.instance.getUserData();
      final String userName = userData['name']; // Name field from Facebook
      final accessToken = result.accessToken?.tokenString;
      // Send accessToken to your ASP.NET Core backend
      final response = await apiService.post(
        endPoint: "api/Auth/log-in-with-Facebook",
        body: {
          'idToken': accessToken,
        },
      );

      var resultData = jsonDecode(response.body);
      if (resultData.statusCode >= 400) {
        Map<String, dynamic> errors = resultData["errors"];
        return left(
            ServerFailure(errMessage: errors.values.toList().join("\n")));
      }
      return right(
        AuthUserEntity(
          email: resultData["data"]["email"],
          name: userName,
          id: resultData["data"]["userId"],
          token: resultData["data"]["token"],
        ),
      );
    } catch (e) {
      return left(
          ServerFailure(errMessage: "Something went wrong, please try again."));
    }
  }

  @override
  Future<Either<ServerFailure, AuthUserEntity>> loginWithGoogle() async {
    try {
      final googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        return left(ServerFailure(errMessage: ""));
      }

      final googleAuth = await googleUser.authentication;
      final idToken = googleAuth.idToken;
      final String? userName = googleUser.displayName; // Display Name
      // Send idToken to your ASP.NET Core backend
      final response = await apiService.post(
        endPoint: "api/Auth/log-in-with-google",
        body: {
          'idToken': idToken,
        },
      );


      var resultData = jsonDecode(response.body);
      if (resultData.statusCode >= 400) {
        Map<String, dynamic> errors = resultData["errors"];
        return left(
            ServerFailure(errMessage: errors.values.toList().join("\n")));
      }
      return right(
        AuthUserEntity(
          email: resultData["data"]["email"],
          name: userName!,
          id: resultData["data"]["userId"],
          token: resultData["data"]["token"],
        ),
      );
    } catch (e) {
      return left(
          ServerFailure(errMessage: "Something went wrong, please try again."));
    }
  }
}
*/
