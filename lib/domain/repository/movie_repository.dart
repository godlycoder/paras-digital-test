import 'package:dartz/dartz.dart';
import 'package:paras_test/domain/uimodel/movie.dart';
import 'package:paras_test/utils/failure.dart';

abstract class MovieRepository {

  Future<Either<Failure, List<MovieUiModel>>> getNowPlayingMovie();

  Future<Either<Failure, List<MovieUiModel>>> getTopRatedMovie();

  Future<Either<Failure, List<MovieUiModel>>> getPopularMovies();

  Future<Either<Failure, bool>> addMovieToFavorite(MovieUiModel data);

  Future<Either<Failure, bool>> deleteMovieFromFavorite(MovieUiModel data);

  Future<Either<Failure, bool>> getFavoriteMovieById(int id);

  Future<Either<Failure, List<MovieUiModel>>> getListFavoriteMovies();

}