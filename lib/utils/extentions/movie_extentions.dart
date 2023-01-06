import 'package:paras_test/data/database/movie_entity.dart';
import 'package:paras_test/data/dto/movie_dto.dart';
import 'package:paras_test/domain/uimodel/movie.dart';

extension MovieDTOMapper on MovieDTO {
  MovieUiModel toUiModel() {
    return MovieUiModel(
      id,
      title,
      'https://image.tmdb.org/t/p/w500$posterPath',
      'https://image.tmdb.org/t/p/original$backdropPath',
      popularity,
      originalTitle,
      voteAverage,
      voteCount,
      overview
    );
  }
}

extension MovieUiModelMapper on MovieUiModel {
  MovieEntity toEntity() {
    return MovieEntity(
        id,
        title,
        posterUrl,
        backdropUrl,
        popularity,
        originalTitle,
        voteAverage,
        totalVote,
        overview
    );
  }
}

extension MovieEntityMapper on MovieEntity {
  MovieUiModel toUiModel() {
    return MovieUiModel(
        id,
        title,
        posterUrl,
        backdropUrl,
        popularity,
        originalTitle,
        voteAverage,
        totalVote,
        overview
    );
  }
}