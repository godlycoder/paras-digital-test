import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:paras_test/domain/uimodel/movie.dart';
import 'package:paras_test/router/router.gr.dart';

class UiKitItemPoster extends StatelessWidget {
  final MovieUiModel? data;

  const UiKitItemPoster({
    super.key,
    required this.data,
  });


  @override
  Widget build(BuildContext context) {
    if (data != null) {
      return Padding(
          padding: const EdgeInsets.only(right: 15),
          child: GestureDetector(
            child: Container(
              width: 180,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                    data!.posterUrl,
                  )
                ),
                color: Colors.grey[300]
              ),
            ),
            onTap: () {
              context.router.navigate(DetailMovieRoute(data: data!));
            },
          )
      );
    }
    return Padding(
        padding: const EdgeInsets.only(right: 15),
        child: Container(
          width: 180,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              color: Colors.grey[300]
          ),
        )
    );
  }

}