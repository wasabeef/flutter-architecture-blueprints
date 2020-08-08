import 'package:app/data/provier/theme_data_source_provider.dart';
import 'package:app/data/repository/theme_repository.dart';
import 'package:app/data/repository/theme_repository_impl.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final FutureProvider<ThemeRepository> themeRepositoryProvider =
    FutureProvider<ThemeRepository>((ref) async => ThemeRepositoryImpl(
        dataSource: await ref.read(themeDataSourceProvider.future)));
