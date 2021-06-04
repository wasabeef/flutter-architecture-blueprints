import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

FocusScopeNode useFocusScope() {
  final context = useContext();
  return FocusScope.of(context);
}
