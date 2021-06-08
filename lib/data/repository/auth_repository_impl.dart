import 'package:app/data/model/result.dart';
import 'package:app/data/provider/auth_data_source_provider.dart';
import 'package:app/data/remote/auth_data_source.dart';
import 'package:app/data/repository/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(this._reader);

  final Reader _reader;

  late final AuthDataSource _dataSource = _reader(authDataSourceProvider);

  @override
  Future<Result<User?>> signIn() {
    return Result.guardFuture(_dataSource.signIn);
  }

  @override
  Future<Result<void>> signOut() {
    return Result.guardFuture(_dataSource.signOut);
  }
}
