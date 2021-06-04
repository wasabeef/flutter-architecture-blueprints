import 'package:app/foundation/extension/date_time.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';

void main() {
  test('DateTime Test', () async {
    final date = DateTime(2020, 8, 10, 5, 55, 6);

    expect(date.format(DateFormat('yyyyMMddHHmmss')), equals('20200810055506'));
    expect(date.formatYYYYMMdd(), equals('2020-08-10'));
  });
}
