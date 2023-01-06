import 'package:dartz/dartz.dart';
import 'package:paras_test/domain/repository/movie_repository.dart';
import 'package:paras_test/domain/uimodel/movie.dart';
import 'package:paras_test/utils/failure.dart';

class GetPopularMovies {
  final MovieRepository _repository;

  GetPopularMovies(this._repository);

  Future<Either<Failure, List<MovieUiModel>>> execute() {
    return _repository.getPopularMovies();
  }

}