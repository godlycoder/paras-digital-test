import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paras_test/app/cubit/movie/movie_cubit.dart';
import 'package:paras_test/app/cubit/movie/movie_state.dart';
import 'package:paras_test/app/ui/component/movie/item_movie.dart';
import 'package:paras_test/app/ui/component/text.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<StatefulWidget> createState() => _FavoritePageState();

}

class _FavoritePageState extends State<FavoritePage> {

  @override
  void initState() {
    BlocProvider.of<MovieCubit>(context)
      .getListFavorite();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 30),
                child: UiKitText('Favorite', type: UiKitTextType.header2),
              ),
              BlocBuilder<MovieCubit, MovieState>(
                  buildWhen: (_, state) {
                    return state is SuccessGetListFavoriteState || state is EmptyListFavoriteState;
                  },
                  builder: (_, state) {
                    if (state is SuccessGetListFavoriteState) {
                      return GridView.builder(
                          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 200,
                            childAspectRatio: 2 / 3,
                          ),
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: state.data.length,
                          itemBuilder: (_, index) {
                            return UiKitItemMovie(data: state.data[index]);
                          }
                      );
                    }

                    return const SizedBox(
                      height: 500,
                      child: Center(
                        child: UiKitText('Empty list'),
                      ),
                    );
                  }
              )
            ],
          ),
        ),
      )
    );
  }
}