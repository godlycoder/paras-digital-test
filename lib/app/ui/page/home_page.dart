import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paras_test/app/cubit/movie/movie_cubit.dart';
import 'package:paras_test/app/cubit/movie/movie_state.dart';
import 'package:paras_test/app/ui/component/movie/block_movie.dart';
import 'package:paras_test/domain/uimodel/movie.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    BlocProvider.of<MovieCubit>(context)
        ..getNowPlayingMovies()
        ..getTopRatedMovies()
        ..getPopularMovies();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            BlocBuilder<MovieCubit, MovieState>(
              buildWhen: (_, state) => state is LoadNowPlayingState || state is SuccessGetNowPlayingState,
              builder: (_, state) {
                List<MovieUiModel>? list;

                if (state is SuccessGetNowPlayingState) {
                  list = state.data;
                }

                return UiKitBlockMovie(
                  title: 'Now Playing',
                  subtitle: 'The list of movie now playing in theaters.',
                  list: list,
                );
              }
            ),
            BlocBuilder<MovieCubit, MovieState>(
              buildWhen: (_, state) => state is LoadTopRatedState || state is SuccessGetTopRatedState,
              builder: (_, state) {
                List<MovieUiModel>? list;

                if (state is SuccessGetTopRatedState) {
                  list = state.data;
                }

                return UiKitBlockMovie(
                  title: 'Top Rated',
                  subtitle: 'The best rated movie of the many people watching.',
                  list: list,
                  type: UiKitBlockMovieType.item,
                );
              }
            ),
            BlocBuilder<MovieCubit, MovieState>(
              buildWhen: (_, state) => state is LoadPopularState || state is SuccessGetPopularState,
              builder: (_, state) {
                List<MovieUiModel>? list;

                if (state is SuccessGetPopularState) {
                  list = state.data;
                }

                return UiKitBlockMovie(
                  title: 'Popular Movies',
                  list: list,
                  type: UiKitBlockMovieType.item,
                );
              }
            ),
          ],
        ),
      ),
    );
  }
}