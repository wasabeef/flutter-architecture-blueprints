import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../remote/auth_data_source.dart';
import '../remote/auth_data_source_impl.dart';

final authDataSourceProvider =
    Provider<AuthDataSource>((ref) => AuthDataSourceImpl(ref.read));
