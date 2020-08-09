import 'package:app/data/app_error.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final errorNotifierProvider = ChangeNotifierProvider((ref) => ErrorNotifier());

class ErrorNotifier extends ChangeNotifier {
  AppError _error;

  bool _hasBeenHandled = true;

  bool get hasBeenHandled => _hasBeenHandled;

  void doOnError(AppError appError) {
    _error = appError;
    _hasBeenHandled = false;
    notifyListeners();
  }

  void doOnSuccess() {
    _error = null;
    _hasBeenHandled = false;
    notifyListeners();
  }

  // Returns the content and prevents its use again.
  AppError getErrorIfNotHandled() {
    if (_hasBeenHandled) {
      _error = null;
      return _error;
    } else {
      _hasBeenHandled = true;
      return _error;
    }
  }

  // Returns the content, even if it's already been handled.
  AppError peekContent() => _error;
}
