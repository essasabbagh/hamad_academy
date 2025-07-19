import 'dart:io';

import 'package:dio/dio.dart';

import 'app_exception.dart';
import 'status_code.dart';

/// Enhanced error handler class with comprehensive error mapping
class ErrorHandler {
  /// Main method to handle any type of error and convert to AppException
  static AppException handle(dynamic error, [StackTrace? stackTrace]) {
    // Handle network connectivity errors
    if (error is SocketException) {
      return AppException(
        message: StatusCode.noInternet.message,
        statusCode: StatusCode.noInternet,
        stackTrace: stackTrace,
      );
    }

    // Handle already processed AppExceptions
    if (error is AppException) {
      return error;
    }

    // Handle Dio HTTP client errors
    if (error is DioException) {
      return _handleDioError(error, stackTrace);
    }

    // Handle format/parsing errors
    if (error is FormatException) {
      return AppException(
        message: StatusCode.formatError.message,
        statusCode: StatusCode.formatError,
        data: error.toString(),
        stackTrace: stackTrace,
      );
    }

    // Handle timeout errors from other sources
    if (error.toString().toLowerCase().contains('timeout')) {
      return AppException(
        message: StatusCode.timeout.message,
        statusCode: StatusCode.timeout,
        data: error.toString(),
        stackTrace: stackTrace,
      );
    }

    // Default unknown error handling
    return AppException(
      message: StatusCode.unknown.message,
      statusCode: StatusCode.unknown,
      data: error.toString(),
      stackTrace: stackTrace,
    );
  }

  /// Handle Dio-specific errors with detailed mapping
  static AppException _handleDioError(
    DioException error, [
    StackTrace? stackTrace,
  ]) {
    switch (error.type) {
      // Timeout-related errors
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return AppException(
          message: StatusCode.timeout.message,
          statusCode: StatusCode.timeout,
          data: error.response?.data,
          stackTrace: stackTrace,
        );

      // Connection-related errors
      case DioExceptionType.connectionError:
        return AppException(
          message: StatusCode.connectionError.message,
          statusCode: StatusCode.connectionError,
          data: error.response?.data,
          stackTrace: stackTrace,
        );

      // HTTP response errors (4xx, 5xx)
      case DioExceptionType.badResponse:
        final statusCode = StatusCode.fromCode(error.response?.statusCode);
        return AppException(
          message: statusCode.message,
          statusCode: statusCode,
          data: error.response?.data,
          stackTrace: stackTrace,
        );

      // Request cancellation
      case DioExceptionType.cancel:
        return AppException(
          message: StatusCode.cancel.message,
          statusCode: StatusCode.cancel,
          data: error.response?.data,
          stackTrace: stackTrace,
        );

      // Unknown Dio errors
      default:
        return AppException(
          message: StatusCode.unknown.message,
          statusCode: StatusCode.unknown,
          data: error.toString(),
          stackTrace: stackTrace,
        );
    }
  }

  /// Quick method to handle Future errors in FutureBuilder
  static AppException handleFutureError(Object error, StackTrace? stackTrace) {
    return handle(error, stackTrace);
  }

  /// Quick method to handle Stream errors in StreamBuilder
  static AppException handleStreamError(Object error, StackTrace? stackTrace) {
    return handle(error, stackTrace);
  }
}
