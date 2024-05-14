import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;
  const Failure({required this.errMessage});
}

class ServerFailure extends Failure {
  ServerFailure({required super.errMessage});
  factory ServerFailure.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(errMessage: 'Connection timeout');
      case DioExceptionType.sendTimeout:
        return ServerFailure(errMessage: 'Send timeout with ApiServer');
      case DioExceptionType.receiveTimeout:
        return ServerFailure(errMessage: 'Receive timeout with ApiServer');
      case DioExceptionType.badCertificate:
        return ServerFailure(errMessage: 'Bad certificate');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
          dioException.response!.statusCode!,
          dioException.response!.data,
        );
      case DioExceptionType.cancel:
        return ServerFailure(errMessage: 'Request to ApiServer was canceled');
      case DioExceptionType.connectionError:
        return ServerFailure(errMessage: 'Connection error');
      case DioExceptionType.unknown:
        if (dioException.message!.contains('SocketException')) {
          return ServerFailure(errMessage: 'No Internet connection');
        }
        return ServerFailure(
          errMessage: 'Unexpected error, please try again',
        );

      default:
        return ServerFailure(
          errMessage: 'Oops there was an error, please try again later',
        );
    }
  }

  factory ServerFailure.fromResponse(
    int statusCode,
    Map<String, dynamic> response,
  ) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(
        errMessage: response['error']['message'],
      );
    } else if (statusCode == 404) {
      return ServerFailure(
        errMessage: 'Your request not found, please try again later',
      );
    } else if (statusCode == 500) {
      return ServerFailure(
        errMessage: 'Internal Server error, please try again later',
      );
    } else {
      return ServerFailure(
        errMessage: 'Oops there was an error, please try again later',
      );
    }
  }
}
