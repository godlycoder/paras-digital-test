class MovieUiModel {
  final int id;
  final String title;
  final String posterUrl;
  final String backdropUrl;
  final double popularity;
  final String originalTitle;
  final dynamic voteAverage;
  final int totalVote;
  bool isFavorite;
  final String overview;

  MovieUiModel(
      this.id,
      this.title,
      this.posterUrl,
      this.backdropUrl,
      this.popularity,
      this.originalTitle,
      this.voteAverage,
      this.totalVote,
      this.overview,
      {this.isFavorite = false}
      );
}