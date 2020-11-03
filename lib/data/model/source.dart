import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'source.freezed.dart';

part 'source.g.dart';

@freezed
abstract class Source with _$Source {
  factory Source({
    String id,
    String name,
  }) = _Source;

  factory Source.fromJson(Map<String, dynamic> json) => _$SourceFromJson(json);
}
