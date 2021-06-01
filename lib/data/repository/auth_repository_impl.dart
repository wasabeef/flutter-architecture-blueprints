import 'package:firebase_auth/firebase_auth.dart' as firebase;
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../model/result.dart';
import '../provider/auth_data_source_provider.dart';
import '../remote/auth_data_source.dart';
import 'auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(this._reader);

  final Reader _reader;

  late final AuthDataSource _dataSource = _reader(authDataSourceProvider);

  @override
  Future<Result<firebase.User?>> signIn() {
    return Result.guardFuture(_dataSource.signIn);
  }

  @override
  Future<Result<void>> signOut() {
    return Result.guardFuture(_dataSource.signOut);
  }
}
