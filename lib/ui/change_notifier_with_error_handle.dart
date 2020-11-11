import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../data/app_error.dart';
import 'error_notifier.dart';

class AppChangeNotifier extends ChangeNotifier {
  AppChangeNotifier(ProviderReference ref) {
    _errorNotifier = ref.read(errorNotifierProvider);
  }

  ErrorNotifier _errorNotifier;

  void doOnError(AppError appError) {
    _errorNotifier.doOnError(appError);
  }

  void doOnSuccess() {
    _errorNotifier.doOnSuccess();
  }
}
