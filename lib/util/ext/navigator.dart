import 'package:flutter/widgets.dart';

extension NavigatorStateExt<T> on NavigatorState {
  Future<T> pushReplacementWithoutAnimation(Widget page) =>
      pushReplacement(PageRouteBuilder<T>(pageBuilder: (_, a1, a2) => page));

  Future<T> pushWithoutAnimation(Widget page) =>
      push(PageRouteBuilder(pageBuilder: (_, a1, a2) => page));
}
