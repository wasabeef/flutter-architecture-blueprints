import 'package:app/flavor.dart';
import 'package:flutter/material.dart';

@immutable
class Constants {
  const Constants({
    @required this.endpoint,
    @required this.apiKey,
  });

  factory Constants.of() {
    switch (config) {
      case Flavor.development:
        return Constants._dev();
      case Flavor.production:
      default:
        return Constants._prd();
    }
  }

  factory Constants._dev() {
    return const Constants(
      endpoint: 'https://newsapi.org',
      apiKey: 'f25c1783fa9b43bca53c6ad2d28defbe',
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

  final String endpoint;
  final String apiKey;
}
