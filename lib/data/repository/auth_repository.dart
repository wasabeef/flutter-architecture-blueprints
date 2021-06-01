import 'package:app/data/model/result.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase;

abstract class AuthRepository {
  Future<Result<firebase.User?>> signIn();

  Future<Result<void>> signOut();
}
