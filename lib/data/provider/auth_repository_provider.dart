import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../repository/auth_repository.dart';
import '../repository/auth_repository_impl.dart';
import 'auth_data_source_provider.dart';

final Provider<AuthRepository> authRepositoryProvider =
    Provider<AuthRepository>(
  (ref) => AuthRepositoryImpl(ref.read(authDataSourceProvider)),
);
