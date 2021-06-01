import 'package:firebase_auth/firebase_auth.dart' as firebase;
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../provider/firebase_auth_provider.dart';
import 'auth_data_source.dart';

class AuthDataSourceImpl implements AuthDataSource {
  const AuthDataSourceImpl(this._read);

  final Reader _read;

  firebase.FirebaseAuth get _firebaseAuth => _read(firebaseAuthProvider);

  @override
  Future<firebase.User?> signIn() async {
    final account = await GoogleSignIn().signIn();
    if (account == null) {
      return throw StateError('Maybe user canceled.');
    }
    final auth = await account.authentication;
    final firebase.AuthCredential authCredential =
        firebase.GoogleAuthProvider.credential(
      idToken: auth.idToken,
      accessToken: auth.accessToken,
    );

    final credential = await _firebaseAuth.signInWithCredential(authCredential);
    final currentUser = await firebase.FirebaseAuth.instance.currentUser;
    assert(credential.user?.uid == currentUser?.uid);
    return credential.user;
  }

  @override
  Future<void> signOut() {
    return GoogleSignIn()
        .signOut()
        .then((_) => _firebaseAuth.signOut())
        .catchError((error) {
      debugPrint(error.toString());
      throw error;
    });
  }
}
