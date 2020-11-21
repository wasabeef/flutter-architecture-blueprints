import 'package:firebase_auth/firebase_auth.dart' as firebase;

import '../model/result.dart';
import '../remote/auth_data_source.dart';
import 'auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(this._dataSource);

  final AuthDataSource _dataSource;

  @override
  Future<Result<firebase.User>> signIn() {
    return Result.guardFuture(_dataSource.signIn);
  }

  @override
  Future<Result<void>> signOut() {
    return Result.guardFuture(_dataSource.signOut);
  }
}
