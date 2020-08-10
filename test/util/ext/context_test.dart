import 'package:app/util/ext/context.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

void main() {
  testWidgets('me testing', (WidgetTester tester) async {
    await tester.pumpWidget(
      Builder(
        builder: (BuildContext context) {
          expect(context.theme, Theme.of(context));
          expect(context.focusScope, FocusScope.of(context));
          return const Placeholder();
        },
      ),
    );
  });
}
