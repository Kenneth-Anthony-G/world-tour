import 'package:dio/dio.dart';

class HttpService {
  final Dio dio;

  HttpService(): dio = Dio(
    BaseOptions(baseUrl: 'https://restcountries.com/v3.1/',
      headers: {
        'Accept': 'application/json',
      },
      followRedirects: false,
      contentType: 'application/json',
    ),
  ){
    dio.interceptors.add(InterceptorsWrapper(
        onRequest: (options,handler) async{
          options.followRedirects = false;
          return handler.next(options);
        },
        onError: (DioException e, handler) {
        // Log the error or transform it into a custom exception
        print('[HTTP ERROR] ${e.message}');
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        print('Connection timeout occurred');
        break;
      case DioExceptionType.sendTimeout:
        print('Send timeout occurred');
        break;
      case DioExceptionType.receiveTimeout:
        print('Receive timeout occurred');
        break;
      case DioExceptionType.badResponse:
        print('Received invalid status code: ${e.response?.statusCode}');
        break;
      case DioExceptionType.cancel:
        print('Request was cancelled');
        break;
      case DioExceptionType.unknown:
        print('Unknown error occurred: ${e.error}');
        break;
      default:
        print('Unexpected error');
    }
    return handler.next(e); // Continue with the error
  },

    ));
}}