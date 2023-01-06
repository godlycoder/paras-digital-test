import 'package:dartz/dartz.dart';
import 'package:paras_test/domain/repository/movie_repository.dart';
import 'package:paras_test/domain/uimodel/movie.dart';
import 'package:paras_test/utils/failure.dart';

class GetFavoriteMovieById {
  final MovieRepository _repository;

  GetFavoriteMovieById(this._repository);

  Future<Either<Failure, bool>> execute(int id) {
    return _repository.getFavoriteMovieById(id);
  }

}