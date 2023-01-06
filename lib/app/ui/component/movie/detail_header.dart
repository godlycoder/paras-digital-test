import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paras_test/app/cubit/movie/movie_cubit.dart';
import 'package:paras_test/app/cubit/movie/movie_state.dart';
import 'package:paras_test/app/ui/component/text.dart';
import 'package:paras_test/domain/uimodel/movie.dart';

class UiKitDetailHeader extends StatefulWidget {
  final MovieUiModel data;

  const UiKitDetailHeader({super.key, required this.data});

  @override
  State<StatefulWidget> createState() => _UiKitDetailHeader();

}

class _UiKitDetailHeader extends State<UiKitDetailHeader> {

  @override
  void initState() {
    BlocProvider.of<MovieCubit>(context)
        .getFavoriteMovieById(widget.data.id);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final data = widget.data;

    return BlocListener<MovieCubit, MovieState>(
      listenWhen: (_, state) {
        return state is SuccessAddToFavoriteState || state is SuccessDeleteFromFavoriteState;
      },
      listener: (_, state) {
        BlocProvider.of<MovieCubit>(context)
            .getFavoriteMovieById(widget.data.id);
      },
      child: SizedBox(
        height: 380,
        child: Stack(
          children: [
            Container(
              height: 300,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(
                          data.backdropUrl
                      )
                  )
              ),
            ),
            Container(
              height: 300,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black54,
                    Colors.white,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        child: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 35,
                        ),
                        onTap: () {
                          context.router.navigateBack();
                        },
                      ),
                      BlocBuilder<MovieCubit, MovieState>(
                          buildWhen: (_, state) {
                            return state is SuccessGetMovieFavorite;
                          },
                          builder: (_, state) {
                            var isFavorite = false;

                            if (state is SuccessGetMovieFavorite) {
                              isFavorite = state.isFavorite;
                            }

                            return GestureDetector(
                              child: Icon(
                                !isFavorite? Icons.favorite_border : Icons.favorite,
                                color: !isFavorite? Colors.white : Colors.pinkAccent,
                                size: 35,
                              ),
                              onTap: () {
                                if (!isFavorite) {
                                  BlocProvider.of<MovieCubit>(context)
                                      .addToFavorite(widget.data);
                                } else {
                                  BlocProvider.of<MovieCubit>(context)
                                      .deleteFromFavorite(widget.data);
                                }
                              },
                            );
                          }
                      )
                    ],
                  ),
                ),
                Expanded(
                    child: Container()
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        width: 120,
                        height: 160,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage(data.posterUrl)
                            )
                        ),
                      ),
                    ),
                    Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            UiKitText(data.originalTitle, type: UiKitTextType.header2, isEllipsized: false),
                            Padding(
                              padding: const EdgeInsets.only(top: 15, right: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      UiKitText(data.popularity.toString(), type: UiKitTextType.title2),
                                      const UiKitText('Popularity', type: UiKitTextType.caption1)
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      UiKitText(data.voteAverage.toString(), type: UiKitTextType.title2),
                                      const UiKitText('Avg. Vote', type: UiKitTextType.caption1)
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      UiKitText(data.totalVote.toString(), type: UiKitTextType.title2),
                                      const UiKitText('Total vote', type: UiKitTextType.caption1)
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        )
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }

}