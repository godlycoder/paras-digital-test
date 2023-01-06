import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiServices {
  final _dio = Dio( 
      BaseOptions(
        baseUrl: 'https://api.themoviedb.org/3',
        connectTimeout: 5000,
        receiveTimeout: 3000,
        queryParameters: {
          'api_key' : 'f49ee808a11a2146a99354eba290f927'
        }
      )
  );
  
  ApiServices() {
    _dio.interceptors
        .add(
          PrettyDioLogger(
            requestHeader: true,
            requestBody: true,
            responseBody: true,
            responseHeader: false,
            error: true,
            compact: true,
            maxWidth: 90
          )
    );
  }

  Future<Response> getNowPlayingMovies() {
    return _dio.get('/movie/now_playing');
  }

  Future<Response> getTopRatedMovies() {
    return _dio.get('/movie/top_rated');
  }

  Future<Response> getPopularMovies() {
    return _dio.get('/movie/popular');
  }

}