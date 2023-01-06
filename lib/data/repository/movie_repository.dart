import 'package:dartz/dartz.dart';
import 'package:paras_test/data/source/movie_data_source.dart';
import 'package:paras_test/domain/repository/movie_repository.dart';
import 'package:paras_test/domain/uimodel/movie.dart';
import 'package:paras_test/utils/extentions/movie_extentions.dart';
import 'package:paras_test/utils/failure.dart';

class MovieRepositoryImpl extends MovieRepository {
  final MovieRemoteDataSource _remoteDataSource;
  final MovieLocalDataSource _localDataSource;

  MovieRepositoryImpl(this._remoteDataSource, this._localDataSource);


  @override
  Future<Either<Failure, List<MovieUiModel>>> getNowPlayingMovie() async {
    try {
      final result = await _remoteDataSource.getNowPlayingMovies();

      return Right(
        result.map((e) => e.toUiModel()).toList()
      );
    } on Exception catch(e) {
      return Left(
        Failure(e.toString())
      );
    }
  }

  @override
  Future<Either<Failure, List<MovieUiModel>>> getTopRatedMovie() async {
    try {
      final result = await _remoteDataSource.getTopRatedMovies();

      return Right(
          result.map((e) => e.toUiModel()).toList()
      );
    } on Exception catch(e) {
      return Left(
          Failure(e.toString())
      );
    }
  }

  @override
  Future<Either<Failure, List<MovieUiModel>>> getPopularMovies() async {
    try {
      final result = await _remoteDataSource.getPopularMovies();

      return Right(
          result.map((e) => e.toUiModel()).toList()
      );
    } on Exception catch(e) {
      return Left(
          Failure(e.toString())
      );
    }
  }

  @override
  Future<Either<Failure, bool>> addMovieToFavorite(MovieUiModel data) async {
    try {

      await _localDataSource.addMovieToFavorite(data.toEntity());

      return const Right(true);
    } on Exception catch(e) {
      return Left(
          Failure(e.toString())
      );
    }
  }

  @override
  Future<Either<Failure, bool>> deleteMovieFromFavorite(MovieUiModel data) async {
    try {
      await _localDataSource.deleteMovieFromFavorite(data.toEntity());

      return const Right(true);
    } on Exception catch(e) {
      return Left(
          Failure(e.toString())
      );
    }
  }

  @override
  Future<Either<Failure, bool>> getFavoriteMovieById(int id) async {
    try {
      final result = await _localDataSource.getFavoriteMovieById(id);

      return Right(result != null);
    } on Exception catch(e) {
      return Left(
          Failure(e.toString())
      );
    }
  }

  @override
  Future<Either<Failure, List<MovieUiModel>>> getListFavoriteMovies() async {
    try {
      final result = await _localDataSource.getListFavoriteMovies();

      return Right(
        result.map((e) => e.toUiModel()).toList()
      );
    } on Exception catch(e) {
      return Left(
          Failure(e.toString())
      );
    }
  }

}