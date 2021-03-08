import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthDataSource {
  Future<User?> signIn();

  Future<void> signOut();
}
