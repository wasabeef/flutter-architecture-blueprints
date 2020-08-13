import 'package:app/l10n/localized.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Message Test', () async {
    final actualEn =
        await Localized.load(const Locale('en', '')).then((l) => l.message);
    expect(actualEn.locale.languageCode, equals('en'));
    expect(actualEn.ok, equals('OK'));
    expect(actualEn.cancel, equals('CANCEL'));
    expect(actualEn.home, equals('Home'));
    expect(actualEn.detail, equals('Detail'));

    final actualJa =
        await Localized.load(const Locale('ja', '')).then((l) => l.message);
    expect(actualJa.locale.languageCode, equals('ja'));
    expect(actualJa.ok, equals('OK'));
    expect(actualJa.cancel, equals('CANCEL'));
    expect(actualJa.home, equals('ホーム'));
    expect(actualJa.detail, equals('詳細'));
  });
}
