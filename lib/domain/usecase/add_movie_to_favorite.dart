import 'package:dartz/dartz.dart';
import 'package:paras_test/domain/repository/movie_repository.dart';
import 'package:paras_test/domain/uimodel/movie.dart';
import 'package:paras_test/utils/failure.dart';

class AddMovieToFavorite {
  final MovieRepository _repository;

  AddMovieToFavorite(this._repository);

  Future<Either<Failure, bool>> execute(MovieUiModel data) {
    return _repository.addMovieToFavorite(data);
  }

}