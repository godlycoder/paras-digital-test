class MovieDTO {

  factory MovieDTO.fromJson(dynamic json) {
    return MovieDTO(
      json['adult'],
      json['backdrop_path'],
      json['id'],
      json['title'],
      json['original_language'],
      json['original_title'],
      json['overview'],
      json['poster_path'],
      json['genre_ids'] != null ? json['genre_ids'].cast<int>() : [],
      json['popularity'],
      json['release_date'],
      json['video'],
      json['vote_average'],
      json['vote_count'],
    );
  }
  final bool adult;
  final String backdropPath;
  final int id;
  final String title;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final String posterPath;
  final List<int> genreIds;
  final double popularity;
  final String releaseDate;
  final bool video;
  final dynamic voteAverage;
  final int voteCount;

  MovieDTO(this.adult, this.backdropPath, this.id, this.title, this.originalLanguage, this.originalTitle, this.overview, this.posterPath, this.genreIds, this.popularity, this.releaseDate, this.video, this.voteAverage, this.voteCount);

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['adult'] = adult;
    map['backdrop_path'] = backdropPath;
    map['id'] = id;
    map['title'] = title;
    map['original_language'] = originalLanguage;
    map['original_title'] = originalTitle;
    map['overview'] = overview;
    map['poster_path'] = posterPath;
    map['genre_ids'] = genreIds;
    map['popularity'] = popularity;
    map['release_date'] = releaseDate;
    map['video'] = video;
    map['vote_average'] = voteAverage;
    map['vote_count'] = voteCount;
    return map;
  }

}