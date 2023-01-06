
import 'package:floor/floor.dart';

@Entity(tableName: 'Movie')
class MovieEntity {

  @primaryKey
  final int id;
  final String title;
  final String posterUrl;
  final String backdropUrl;
  final double popularity;
  final String originalTitle;
  final double voteAverage;
  final int totalVote;
  final String overview;

  MovieEntity(
      this.id,
      this.title,
      this.posterUrl,
      this.backdropUrl,
      this.popularity,
      this.originalTitle,
      this.voteAverage,
      this.totalVote,
      this.overview
      );

}