import 'package:paras_test/data/database/movie_dao.dart';
import 'package:paras_test/data/database/movie_entity.dart';
import 'package:paras_test/data/dto/movie_dto.dart';
import 'package:paras_test/data/service/api_services.dart';

abstract class MovieRemoteDataSource {
  Future<List<MovieDTO>> getNowPlayingMovies();

  Future<List<MovieDTO>> getTopRatedMovies();

  Future<List<MovieDTO>> getPopularMovies();
}

abstract class MovieLocalDataSource {

  Future<void> addMovieToFavorite(MovieEntity entity);

  Future<void> deleteMovieFromFavorite(MovieEntity entity);

  Future<MovieEntity?> getFavoriteMovieById(int id);

  Future<List<MovieEntity>> getListFavoriteMovies();

}

class MovieRemoteDataSourceImpl extends MovieRemoteDataSource {
  final ApiServices _apiServices;

  MovieRemoteDataSourceImpl(this._apiServices);

  @override
  Future<List<MovieDTO>> getNowPlayingMovies() async {
    final response = await _apiServices.getNowPlayingMovies();
    final result = response.data['results'] as List;

    return result.map((e) => MovieDTO.fromJson(e)).toList();
  }

  @override
  Future<List<MovieDTO>> getTopRatedMovies() async {
    final response = await _apiServices.getTopRatedMovies();
    final result = response.data['results'] as List;

    return result.map((e) => MovieDTO.fromJson(e)).toList();
  }

  @override
  Future<List<MovieDTO>> getPopularMovies() async {
    final response = await _apiServices.getPopularMovies();
    final result = response.data['results'] as List;

    return result.map((e) => MovieDTO.fromJson(e)).toList();
  }

}

class MovieLocalDataSourceImpl extends MovieLocalDataSource {
  final MovieDao _dao;

  MovieLocalDataSourceImpl(this._dao);

  @override
  Future<void> addMovieToFavorite(MovieEntity entity) {
    return _dao.insertMovie(entity);
  }

  @override
  Future<void> deleteMovieFromFavorite(MovieEntity entity) {
    return _dao.deleteMovie(entity);
  }

  @override
  Future<MovieEntity?> getFavoriteMovieById(int id) {
    return _dao.fetchMovieById(id);
  }

  @override
  Future<List<MovieEntity>> getListFavoriteMovies() {
    return _dao.fetchAllMovies();
  }

}