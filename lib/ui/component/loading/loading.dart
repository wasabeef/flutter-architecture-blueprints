import 'package:app/ui/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Loading extends HookWidget {
  const Loading();

  @override
  Widget build(BuildContext context) {
    final theme = useProvider(appThemeProvider);
    return Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(theme.appColors.accent),
      ),
    );
  }
}
