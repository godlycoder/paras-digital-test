import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paras_test/app/cubit/movie/movie_state.dart';
import 'package:paras_test/domain/uimodel/movie.dart';
import 'package:paras_test/domain/usecase/add_movie_to_favorite.dart';
import 'package:paras_test/domain/usecase/delete_movie_from_favorite.dart';
import 'package:paras_test/domain/usecase/get_favorite_movie_by_id.dart';
import 'package:paras_test/domain/usecase/get_list_favorite_movies.dart';
import 'package:paras_test/domain/usecase/get_now_playing_movies.dart';
import 'package:paras_test/domain/usecase/get_popular_movies.dart';
import 'package:paras_test/domain/usecase/get_top_rated_movies.dart';

class MovieCubit extends Cubit<MovieState> {
  final GetNowPlayingMovies _getNowPlayingMovies;
  final GetTopRatedMovies _getTopRatedMovies;
  final GetPopularMovies _getPopularMovies;
  final AddMovieToFavorite _addMovieToFavorite;
  final DeleteMovieFromFavorite _deleteMovieFromFavorite;
  final GetFavoriteMovieById _getFavoriteMovieById;
  final GetListFavoriteMovies _getListFavoriteMovies;

  MovieCubit(
      this._getNowPlayingMovies,
      this._getTopRatedMovies,
      this._getPopularMovies,
      this._addMovieToFavorite,
      this._deleteMovieFromFavorite,
      this._getFavoriteMovieById,
      this._getListFavoriteMovies
      ) : super(InitialBannerState());

  void getNowPlayingMovies() async {
    emit(LoadNowPlayingState());

    final result = await _getNowPlayingMovies.execute();

    result.fold(
      (failure) => emit(ErrorLoadNowPlayingState(failure.message)),
      (success) => emit(SuccessGetNowPlayingState(success))
    );
  }

  void getTopRatedMovies() async {
    emit(LoadTopRatedState());

    final result = await _getTopRatedMovies.execute();

    result.fold(
        (failure) => emit(ErrorLoadTopRatedState(failure.message)),
        (success) => emit(SuccessGetTopRatedState(success))
    );
  }

  void getPopularMovies() async {
    emit(LoadPopularState());

    final result = await _getPopularMovies.execute();

    result.fold(
            (failure) => emit(ErrorLoadPopularState(failure.message)),
            (success) => emit(SuccessGetPopularState(success))
    );
  }

  void addToFavorite(MovieUiModel data) async {
    final result = await _addMovieToFavorite.execute(data);
    result.fold(
      (failure) => emit(ErrorAddToFavoriteState(failure.message)),
      (success) => emit(SuccessAddToFavoriteState())
    );
  }

  void deleteFromFavorite(MovieUiModel data) async {
    final result = await _deleteMovieFromFavorite.execute(data);
    result.fold(
      (failure) => emit(ErrorDeleteFromFavoriteState(failure.message)),
      (success) => emit(SuccessDeleteFromFavoriteState())
    );
  }

  void getFavoriteMovieById(int id) async {
    final result = await _getFavoriteMovieById.execute(id);
    result.fold(
      (failure) => emit(SuccessGetMovieFavorite(false)),
      (success) => emit(SuccessGetMovieFavorite(success))
    );
  }

  void getListFavorite() async {
    final result = await _getListFavoriteMovies.execute();
    result.fold(
      (failure) => emit(EmptyListFavoriteState()),
      (success) {
        if (success.isEmpty) {
          emit(EmptyListFavoriteState());
        } else {
          emit(SuccessGetListFavoriteState(success));
        }
      }
    );
  }

}