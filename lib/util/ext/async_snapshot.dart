import 'package:flutter/widgets.dart';

extension AsyncSnapshotExt on AsyncSnapshot {
  bool get isNothing => connectionState == ConnectionState.none;

  bool get isActive => connectionState == ConnectionState.active;

  bool get isDone => connectionState == ConnectionState.done;

  bool get isWaiting => connectionState == ConnectionState.waiting;
}
