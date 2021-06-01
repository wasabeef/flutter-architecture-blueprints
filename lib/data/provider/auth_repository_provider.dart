import 'package:app/data/repository/auth_repository.dart';
import 'package:app/data/repository/auth_repository_impl.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final authRepositoryProvider =
    Provider<AuthRepository>((ref) => AuthRepositoryImpl(ref.read));
