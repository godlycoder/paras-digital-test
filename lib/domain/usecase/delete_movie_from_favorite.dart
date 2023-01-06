import 'package:dartz/dartz.dart';
import 'package:paras_test/domain/repository/movie_repository.dart';
import 'package:paras_test/domain/uimodel/movie.dart';
import 'package:paras_test/utils/failure.dart';

class DeleteMovieFromFavorite {
  final MovieRepository _repository;

  DeleteMovieFromFavorite(this._repository);

  Future<Either<Failure, bool>> execute(MovieUiModel data) {
    return _repository.deleteMovieFromFavorite(data);
  }

}