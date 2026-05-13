import 'dart:developer';
import 'package:akhbarna/core/resources/colors_managers.dart';
import 'package:akhbarna/l10n/app_localizations.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../core/utils/ui_utils.dart';
import '../features/auth/login/data/models/LoginResponse.dart';

class FirebaseServices {
  static Future<LoginResponse?> signInWithGoogle(BuildContext context) async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn.instance;

      googleSignIn.initialize(
        serverClientId:
            "901378013831-rgf4sg4v2bukktjtru6rlg4uccgrehkq.apps.googleusercontent.com",
      );

      final GoogleSignInAccount? googleUser = await googleSignIn.authenticate();

      if (googleUser == null) return null;

      final GoogleSignInAuthentication googleAuth = googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
      );

      final userCredential = await FirebaseAuth.instance.signInWithCredential(
        credential,
      );

      final user = userCredential.user;

      if (user == null) return null;

      final loginResponse = LoginResponse(
        id: user.uid,
        name: user.displayName ?? '',
        email: user.email ?? '',
        profileImageUrl: user.photoURL ?? '',
        token: await user.getIdToken() ?? '',
      );

      UiUtils.showToast(
        context,
        AppLocalizations.of(context)!.login_success,
        ColorsManagers.riverBed,
      );
      return loginResponse;
    } catch (exception) {
      log(exception.toString());

      UiUtils.showToast(
        context,
        AppLocalizations.of(context)!.failed_login,
        ColorsManagers.vividTangerine,
      );

      return null;
    }
  }
}
