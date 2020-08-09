import 'package:app/app.dart';
import 'package:app/ui/component/loading.dart';
import 'package:app/ui/detail/datail_page.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_test_utils/image_test_utils.dart';
import 'package:mockito/mockito.dart';

mixin MockDetailPage implements Mock, DetailPage {}

void main() {
  testWidgets('App', (WidgetTester tester) async {
    await provideMockedNetworkImages(() async {
      await tester.pumpWidget(ProviderScope(
//        overrides: [],
        child: App(),
      ));
    });
  });
  testWidgets('Loading', (WidgetTester tester) async {
    await tester.pumpWidget(const Loading());
  });
}
