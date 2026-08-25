import 'dart:developer';

import 'package:cinebox_flutter/core/result/result.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'google_sign_in_service.dart';

class GoogleSignInServiceImpl implements GoogleSignInService {
  @override
  Future<Result<String>> isSignedIn() async {
    try {
      final logged = await GoogleSignIn.instance
          .attemptLightweightAuthentication();

      if (logged case GoogleSignInAccount(
        authentication: GoogleSignInAuthentication(:final idToken?),
      )) {
        return Success(idToken);
      }

      return Failure(Exception('User is not signed in with Google'));
    } catch (e, s) {
      log(
        'Failed to check Google sign-in status',
        name: 'GoogleSignInService',
        error: e,
        stackTrace: s,
      );
      return Failure(Exception('Failed to check Google sign-in status'));
    }
  }

  @override
  Future<Result<String>> signIn() async {
    try {
      final auth = await GoogleSignIn.instance.authenticate(
        scopeHint: ['email', 'profile', 'openid'],
      );

      if (auth.authentication case GoogleSignInAuthentication(
        idToken: final idToken?,
      )) {
        return Success(idToken);
      } else {
        return Failure(Exception('Failed to sign in with Google'));
      }
    } catch (e, s) {
      log(
        'Failed to sign in with Google',
        name: 'GoogleSignInService',
        error: e,
        stackTrace: s,
      );
      return Failure(Exception('Failed to sign in with Google'));
    }
  }

  @override
  Future<Result<Unit>> signOut() async {
    try {
      await GoogleSignIn.instance.signOut();
      return successOfUnit();
    } catch (e, s) {
      log(
        'Failed to sign out from Google',
        name: 'GoogleSignInService',
        error: e,
        stackTrace: s,
      );
      return Failure(Exception('Failed to sign out from Google'));
    }
  }
}
