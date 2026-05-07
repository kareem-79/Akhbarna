import 'dart:developer';

import 'package:akhbarna/core/resources/colors_managers.dart';
import 'package:akhbarna/l10n/app_localizations.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../core/utils/ui_utils.dart';

class FirebaseServices {
  static Future<void> signInWithGoogle(BuildContext context) async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn.instance;
      googleSignIn.initialize(
        serverClientId:
            "901378013831-rgf4sg4v2bukktjtru6rlg4uccgrehkq.apps.googleusercontent.com",
      );

      final GoogleSignInAccount? googleUser = await googleSignIn.authenticate();
      if (googleUser == null) return;
      final GoogleSignInAuthentication googleAuth = googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
      );
      await FirebaseAuth.instance.signInWithCredential(credential);
      UiUtils.showLoadingDialog(context);
      UiUtils.showToast(
        context,
        AppLocalizations.of(context)!.login_success,
        ColorsManagers.riverBed,
      );
    } catch (exception) {
      log(exception.toString());
      UiUtils.showToast(
        context,
        AppLocalizations.of(context)!.failed_login,
        ColorsManagers.vividTangerine,
      );
    }
  }
}
