import 'package:cargo_shift/core/helpers/app_constants.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';

class BaseHttp extends DioForNative {
  BaseHttp() {
    options = BaseOptions(
      connectTimeout: const Duration(milliseconds: AppConstants.connectTimeout),
      receiveTimeout: const Duration(milliseconds: AppConstants.receiveTimeout),
      headers: {
        'Content-Type': 'application/json',
      },
    );
  }
}
