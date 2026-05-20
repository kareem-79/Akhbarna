import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:akhbarna/core/resources/colors_managers.dart';
import 'package:akhbarna/core/resources/constant.dart';
import 'package:akhbarna/l10n/app_localizations.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/utils/ui_utils.dart';
import '../features/auth/login/data/models/LoginResponse.dart';

class FirebaseServices {
  static Future<LoginResponse?> signInWithGoogle(
      BuildContext context,
      ) async {
    try {
      final GoogleSignIn googleSignIn =
          GoogleSignIn.instance;

      await googleSignIn.initialize(
        serverClientId:
        "901378013831-rgf4sg4v2bukktjtru6rlg4uccgrehkq.apps.googleusercontent.com",
      );

      UiUtils.showLoadingDialog(
        context,
        isDisable: false,
      );
      final GoogleSignInAccount? googleUser =
      await googleSignIn.authenticate();

      if (googleUser == null) {
        UiUtils.hideDialog(context);
        return null;
      }

      final GoogleSignInAuthentication googleAuth =
          googleUser.authentication;

      final credential =
      GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
      );

      final userCredential =
      await FirebaseAuth.instance
          .signInWithCredential(
        credential,
      );

      final user = userCredential.user;

      if (user == null) {
        UiUtils.hideDialog(context);
        return null;
      }

      Dio dio = Dio(
        BaseOptions(
          baseUrl: ApiConstant.baseUrl,
          validateStatus: (status) {
            return status != null && status < 500;
          },
        ),
      );

      final response = await dio.post(
        ApiConstant.registerEndpoint,
        data: {
          "name": user.displayName ??
              "Google User",
          "email": user.email ?? "",
          "password": "Google@123",
        },
      );

      if (response.statusCode == 200 ||
          response.statusCode == 201) {

        final loginResponse =
        LoginResponse.fromJson(
          response.data,
        );

        SharedPreferences prefs =
        await SharedPreferences
            .getInstance();

        await prefs.setString(
          ChachConstant.tokenKey,
          loginResponse.token,
        );

        UiUtils.hideDialog(context);

        UiUtils.showToast(
          context,
          AppLocalizations.of(context)!
              .login_success,
          ColorsManagers.riverBed,
        );

        return loginResponse;
      }

      else if (response.data["error"] ==
          "Email already exists") {

        final loginResponseApi =
        await dio.post(
          ApiConstant.loginEndpoint,
          data: {
            "email": user.email ?? "",
            "password": "Google@123",
          },
        );

        final loginResponse =
        LoginResponse.fromJson(
          loginResponseApi.data,
        );

        SharedPreferences prefs =
        await SharedPreferences
            .getInstance();

        await prefs.setString(
          ChachConstant.tokenKey,
          loginResponse.token,
        );

        UiUtils.hideDialog(context);

        UiUtils.showToast(
          context,
          AppLocalizations.of(context)!
              .login_success,
          ColorsManagers.riverBed,
        );

        return loginResponse;
      }

      else {
        UiUtils.hideDialog(context);

        UiUtils.showToast(
          context,
          response.data["error"] ??
              "Failed Login",
          ColorsManagers.vividTangerine,
        );

        return null;
      }
    }

    on DioException catch (e) {
      log(
        "DIO ERROR => ${e.response?.data}",
      );

      UiUtils.hideDialog(context);

      UiUtils.showToast(
        context,
        e.response?.data["error"] ??
            "Server Error",
        ColorsManagers.vividTangerine,
      );

      return null;
    }

    catch (exception) {
      log(exception.toString());

      UiUtils.hideDialog(context);

      UiUtils.showToast(
        context,
        AppLocalizations.of(context)!
            .failed_login,
        ColorsManagers.vividTangerine,
      );

      return null;
    }
  }
}