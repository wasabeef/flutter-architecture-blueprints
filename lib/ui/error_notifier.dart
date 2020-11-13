import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../data/app_error.dart';

final errorNotifierProvider = ChangeNotifierProvider((ref) => ErrorNotifier());

class ErrorNotifier extends ChangeNotifier {
  ApiError _error;

  bool _hasBeenHandled = true;

  bool get hasBeenHandled => _hasBeenHandled;

  void doOnError(ApiError appError) {
    _error = appError;
    _hasBeenHandled = false;
    notifyListeners();
  }

  void doOnSuccess() {
    _error = null;
    _hasBeenHandled = true;
  }

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
  ApiError peekContent() => _error;
}
