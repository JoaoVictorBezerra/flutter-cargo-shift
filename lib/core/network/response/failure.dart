import 'package:dio/dio.dart';

import 'api_response.dart';

abstract class Failure {
  Failure._();

  factory Failure.dioFailure(DioError error) = DioFailure;
  factory Failure.dataFailure(ErrorResponse error) = DataFailure;
  factory Failure.unknownFailure(TypeError error) = UnknownFailure;

  String get code;

  String get message;

  dynamic get response;
}

class DioFailure extends Failure {
  DioFailure(this.error) : super._();

  final DioError error;

  @override
  String get code => error.response?.statusCode.toString() ?? '';

  @override
  String get message => error.response?.data != null
      ? ErrorResponse.fromJson(error.response?.data).message
      : 'default_error_message';

  @override
  dynamic get response => error.response;
}

class DataFailure extends Failure {
  DataFailure(this.error) : super._();

  final ErrorResponse error;

  @override
  String get code => error.message;

  @override
  String get message => error.message;

  @override
  dynamic get response => error.message;
}

class UnknownFailure extends Failure {
  UnknownFailure(this.error) : super._();

  final TypeError error;

  @override
  String get code => error.hashCode.toString();

  @override
  String get message => 'default_error_message';

  @override
  dynamic get response => error;
}
