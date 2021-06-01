import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../hook/use_theme.dart';

class Loading extends HookWidget {
  const Loading();

  @override
  Widget build(BuildContext context) {
    final theme = useTheme();
    return Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(theme.accentColor),
      ),
    );
  }
}
