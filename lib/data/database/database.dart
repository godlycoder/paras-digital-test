import 'package:floor/floor.dart';
import 'package:paras_test/data/database/movie_entity.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'dart:async';

import 'movie_dao.dart';

part 'database.g.dart';

@Database(version: 1, entities: [MovieEntity])
abstract class AppDatabase extends FloorDatabase {

  MovieDao get movieDao;

}