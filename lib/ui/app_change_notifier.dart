import 'package:flutter/material.dart';

import '../data/app_error.dart';

class AppChangeNotifier extends ChangeNotifier {
  ApiError _error;

  // ignore: avoid_setters_without_getters
  set error(Exception value) {
    _error = ApiError(value);
    _hasBeenHandled = false;
    debugPrint(_error.type.toString());
  }

  bool _hasBeenHandled = true;

  bool get hasBeenHandled => _hasBeenHandled;

  // Returns the content and prevents its use again.
  ApiError getErrorIfNotHandled() {
    if (_hasBeenHandled) {
      _error = null;
      return _error;
    } else {
      _hasBeenHandled = true;
      return _error;
    }
  }

  // Returns the content, even if it's already been handled.
  ApiError errorPeekContent() => _error;
}
