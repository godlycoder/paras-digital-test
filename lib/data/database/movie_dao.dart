
import 'package:floor/floor.dart';
import 'package:paras_test/data/database/movie_entity.dart';

@dao
abstract class MovieDao {

  @insert
  Future<void> insertMovie(MovieEntity entity);

  @delete
  Future<void> deleteMovie(MovieEntity entity);

  @Query('SELECT * FROM Movie WHERE id = :id')
  Future<MovieEntity?> fetchMovieById(int id);

  @Query('SELECT * FROM Movie')
  Future<List<MovieEntity>> fetchAllMovies();

}