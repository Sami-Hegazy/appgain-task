import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;

  const Failure({required this.errMessage});
}

class ServerFailure extends Failure {
  ServerFailure({required super.errMessage});

  factory ServerFailure.fromDioError(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(errMessage: 'Connection timeout with api server');
      case DioExceptionType.sendTimeout:
        return ServerFailure(errMessage: 'Send timeout with api server');
      case DioExceptionType.receiveTimeout:
        return ServerFailure(errMessage: 'Recirve timeout with api server');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            dioException.response!.statusCode!, dioException.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure(errMessage: 'Request Canceled');
      case DioExceptionType.connectionError:
        return ServerFailure(errMessage: 'Connection error');
      case DioExceptionType.unknown:
        if (dioException.message!.contains('SocketException')) {
          return ServerFailure(errMessage: 'No Internet Connection');
        }
        return ServerFailure(errMessage: 'Unkown Error');
      case DioExceptionType.badCertificate:
        return ServerFailure(errMessage: 'Bad Certificate');
      default:
        return ServerFailure(
            errMessage: 'Opps there was an error, Please try again later!');
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(errMessage: response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure(
          errMessage: 'You request not found , Please try later');
    } else if (statusCode == 500) {
      return ServerFailure(
          errMessage: 'Internal server error, Please try later ');
    } else {
      return ServerFailure(
          errMessage: 'Opps there was an error, Please try again later!');
    }
  }
}
