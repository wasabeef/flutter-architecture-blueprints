import 'package:app/data/remote/auth_data_source.dart';
import 'package:app/data/remote/auth_data_source_impl.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final authDataSourceProvider =
    Provider<AuthDataSource>((ref) => AuthDataSourceImpl(ref.read));
