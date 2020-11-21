import 'package:firebase_auth/firebase_auth.dart' as firebase;

import '../model/result.dart';

abstract class AuthRepository {
  Future<Result<firebase.User>> signIn();

  Future<Result<void>> signOut();
}
