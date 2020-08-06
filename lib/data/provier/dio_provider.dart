import 'package:app/data/remote/app_dio.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final Provider<Dio> dioProvider = Provider<Dio>((_) => AppDio.getInstance());
