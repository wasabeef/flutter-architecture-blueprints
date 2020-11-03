import 'package:flutter_gen/gen_l10n/app_localizations_en.dart';
import 'package:flutter_gen/gen_l10n/app_localizations_ja.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Message Test', () async {
    final actualEn = AppLocalizationsEn();
    expect(actualEn.localeName, equals('en'));
    expect(actualEn.ok, equals('OK'));
    expect(actualEn.cancel, equals('CANCEL'));
    expect(actualEn.home, equals('Home'));
    expect(actualEn.detail, equals('Detail'));

    final actualJa = AppLocalizationsJa();
    expect(actualJa.localeName, equals('ja'));
    expect(actualJa.ok, equals('OK'));
    expect(actualJa.cancel, equals('CANCEL'));
    expect(actualJa.home, equals('ホーム'));
    expect(actualJa.detail, equals('詳細'));
  });
}
