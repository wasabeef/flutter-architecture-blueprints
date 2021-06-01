import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../repository/auth_repository.dart';
import '../repository/auth_repository_impl.dart';

final authRepositoryProvider =
    Provider<AuthRepository>((ref) => AuthRepositoryImpl(ref.read));
