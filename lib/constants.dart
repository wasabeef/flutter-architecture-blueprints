import 'package:app/flavor.dart';
import 'package:flutter/material.dart';

@immutable
class Constants {
  const Constants({
    @required this.endpoint,
  });

  factory Constants.of() {
    switch (config) {
      case Flavor.development:
        return Constants.dev();
      case Flavor.production:
      default:
        return Constants.prd();
    }
  }

  factory Constants.dev() {
    return const Constants(
      endpoint: 'http://localhost:3000/api',
    );
  }

  factory Constants.prd() {
    return const Constants(
      endpoint: 'http://localhost:3000/api',
    );
  }

  // Routing name
  static const String PAGE_HOME = '/home';

  final String endpoint;
}
