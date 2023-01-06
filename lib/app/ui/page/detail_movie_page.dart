import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:paras_test/app/ui/component/movie/detail_header.dart';
import 'package:paras_test/app/ui/component/text.dart';
import 'package:paras_test/domain/uimodel/movie.dart';

class DetailMoviePage extends StatefulWidget {
  final MovieUiModel data;

  const DetailMoviePage({super.key, required this.data});

  @override
  State<StatefulWidget> createState() => _DetailMoviePageState();

}

class _DetailMoviePageState extends State<DetailMoviePage> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            UiKitDetailHeader(data: widget.data),
            const Padding(
              padding: EdgeInsets.only(left: 20, top: 30, bottom: 20),
              child: UiKitText('Overview', type: UiKitTextType.title1),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: UiKitText(
                widget.data.overview,
                type: UiKitTextType.body1,
                isEllipsized: false,
              ),
            ),
          ],
        ),
      ),
    );
  }

}