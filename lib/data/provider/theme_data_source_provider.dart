import 'package:app/data/local/theme_data_source_impl.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final themeDataSourceProvider =
    Provider((ref) => ThemeDataSourceImpl(ref.read));
