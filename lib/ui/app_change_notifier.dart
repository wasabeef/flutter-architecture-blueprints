import 'package:flutter/material.dart';

import '../data/app_error.dart';

class AppChangeNotifier extends ChangeNotifier {
  ApiError _error;

  // ignore: avoid_setters_without_getters
  set error(Exception value) {
    _error = ApiError(value);
    _errorHasBeenHandledError = false;
  }

  bool _errorHasBeenHandledError = true;

  bool get errorHasBeenHandled => _errorHasBeenHandledError;

  // Returns the content and prevents its use again.
  ApiError getErrorIfNotHandled() {
    if (_errorHasBeenHandledError) {
      _error = null;
      return _error;
    } else {
      _errorHasBeenHandledError = true;
      return _error;
    }
  }

  // Returns the content, even if it's already been handled.
  ApiError peekErrorContent() => _error;
}
