import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_user.freezed.dart';

@freezed
abstract class AppUser with _$AppUser {
  factory AppUser({
    String? userId,
    String? imageUrl,
    String? name,
    String? email,
  }) = _AppUser;

  factory AppUser.from(User? firebaseUser) {
    return AppUser(
      userId: firebaseUser?.uid,
      imageUrl: firebaseUser?.photoURL,
      name: firebaseUser?.displayName,
      email: firebaseUser?.email,
    );
  }
}
