import 'package:app/data/local/app_user.dart';
import 'package:app/data/model/result.dart';
import 'package:app/data/remote/auth_data_source.dart';
import 'package:app/data/remote/auth_data_source_impl.dart';
import 'package:app/data/repository/auth_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final authRepositoryProvider = Provider((ref) => AuthRepositoryImpl(ref.read));

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(this._reader);

  final Reader _reader;

  late final AuthDataSource _dataSource = _reader(authDataSourceProvider);

  @override
  Future<Result<AppUser>> signIn() {
    return Result.guardFuture(
        () async => AppUser.from(await _dataSource.signIn()));
  }

  @override
  Future<Result<void>> signOut() {
    return Result.guardFuture(_dataSource.signOut);
  }
}
