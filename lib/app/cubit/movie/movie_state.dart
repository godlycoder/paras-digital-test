import 'package:paras_test/domain/uimodel/movie.dart';

abstract class MovieState {}

class InitialBannerState extends MovieState {}

class LoadNowPlayingState extends MovieState {}

class SuccessGetNowPlayingState extends MovieState {
  final List<MovieUiModel> data;

  SuccessGetNowPlayingState(this.data);
}

class ErrorLoadNowPlayingState extends MovieState {
  final String message;

  ErrorLoadNowPlayingState(this.message);
}

class LoadTopRatedState extends MovieState {}

class SuccessGetTopRatedState extends MovieState {
  final List<MovieUiModel> data;

  SuccessGetTopRatedState(this.data);
}

class ErrorLoadTopRatedState extends MovieState {
  final String message;

  ErrorLoadTopRatedState(this.message);
}

class LoadPopularState extends MovieState {}

class SuccessGetPopularState extends MovieState {
  final List<MovieUiModel> data;

  SuccessGetPopularState(this.data);
}

class ErrorLoadPopularState extends MovieState {
  final String message;

  ErrorLoadPopularState(this.message);
}

class ErrorAddToFavoriteState extends MovieState {
  final String message;

  ErrorAddToFavoriteState(this.message);
}

class SuccessAddToFavoriteState extends MovieState {}

class ErrorDeleteFromFavoriteState extends MovieState {
  final String message;

  ErrorDeleteFromFavoriteState(this.message);
}

class SuccessDeleteFromFavoriteState extends MovieState {}

class SuccessGetMovieFavorite extends MovieState {
  final bool isFavorite;

  SuccessGetMovieFavorite(this.isFavorite);
}

class SuccessGetListFavoriteState extends MovieState {
  final List<MovieUiModel> data;

  SuccessGetListFavoriteState(this.data);
}

class EmptyListFavoriteState extends MovieState {}