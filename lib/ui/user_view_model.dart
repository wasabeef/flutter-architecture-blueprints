import 'package:app/data/provider/auth_repository_provider.dart';
import 'package:app/data/repository/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase;
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final userViewModelProvider =
    ChangeNotifierProvider((ref) => UserViewModel(ref.read));

class UserViewModel extends ChangeNotifier {
  UserViewModel(this._reader);

  final Reader _reader;

  late final AuthRepository _repository = _reader(authRepositoryProvider);

  firebase.User? _user;

  firebase.User? get user => _user;

  bool get isAuthenticated => _user != null;

  Future<void> signIn() {
    return _repository.signIn().then((result) {
      // Result use case No.2
      result.ifSuccess((data) {
        _user = data;
        notifyListeners();
      });
    });
  }

  Future<void> signOut() {
    return _repository.signOut().then((result) {
      return result.when(
          success: (_) {
            _user = null;
            notifyListeners();
          },
          failure: (_) => result);
    });
  }
}
