import 'package:app/data/provider/firebase_auth_provider.dart';
import 'package:app/data/remote/auth_data_source.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase;
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final authDataSourceProvider = Provider((ref) => AuthDataSourceImpl(ref.read));

class AuthDataSourceImpl implements AuthDataSource {
  AuthDataSourceImpl(this._reader);

  final Reader _reader;

  late final firebase.FirebaseAuth _firebaseAuth =
      _reader(firebaseAuthProvider);

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
