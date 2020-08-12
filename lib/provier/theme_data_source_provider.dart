import 'package:app/data/local/theme_data_source.dart';
import 'package:app/data/local/theme_data_source_impl.dart';
import 'package:app/provier/shared_preferences_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final FutureProvider<ThemeDataSource> themeDataSourceProvider = FutureProvider(
    (ref) async =>
        ThemeDataSourceImpl(prefs: await ref.read(prefsProvider.future)));
