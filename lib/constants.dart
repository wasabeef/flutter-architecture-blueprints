import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';

enum Flavor { development, production }

@immutable
class Constants {
  const Constants({
    @required this.endpoint,
    @required this.apiKey,
  });

  factory Constants.of() {
    if (_instance != null) {
      return _instance;
    }

    final flavor = EnumToString.fromString(
      Flavor.values,
      const String.fromEnvironment('FLAVOR'),
    );

    switch (flavor) {
      case Flavor.development:
        _instance = Constants._dev();
        break;
      case Flavor.production:
      default:
        _instance = Constants._prd();
    }
    return _instance;
  }

  factory Constants._dev() {
    return const Constants(
      endpoint: 'https://newsapi.org',
      apiKey: '98c8df982b8b4da8b86cd70e851fc521',
    );
  }

  factory Constants._prd() {
    return const Constants(
      endpoint: 'https://newsapi.org',
      apiKey: '4bc454db94464956aea4cbb01f4bf9f4',
    );
  }

  // Routing name
  static const String PAGE_HOME = '/home';
  static const String PAGE_DETAIL = '/detail';

  static Constants _instance;

  final String endpoint;
  final String apiKey;
}
