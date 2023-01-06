import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:paras_test/app/cubit/account/account_cubit.dart';
import 'package:paras_test/app/cubit/movie/movie_cubit.dart';
import 'package:paras_test/data/database/database.dart';
import 'package:paras_test/data/repository/account_repository.dart';
import 'package:paras_test/data/repository/movie_repository.dart';
import 'package:paras_test/data/service/api_services.dart';
import 'package:paras_test/data/source/account_data_source.dart';
import 'package:paras_test/data/source/movie_data_source.dart';
import 'package:paras_test/domain/repository/account_repository.dart';
import 'package:paras_test/domain/repository/movie_repository.dart';
import 'package:paras_test/domain/usecase/add_movie_to_favorite.dart';
import 'package:paras_test/domain/usecase/delete_movie_from_favorite.dart';
import 'package:paras_test/domain/usecase/do_check_sign_in_status.dart';
import 'package:paras_test/domain/usecase/do_sign_in.dart';
import 'package:paras_test/domain/usecase/do_sign_out.dart';
import 'package:paras_test/domain/usecase/get_account.dart';
import 'package:paras_test/domain/usecase/get_favorite_movie_by_id.dart';
import 'package:paras_test/domain/usecase/get_list_favorite_movies.dart';
import 'package:paras_test/domain/usecase/get_now_playing_movies.dart';
import 'package:paras_test/domain/usecase/get_popular_movies.dart';
import 'package:paras_test/domain/usecase/get_top_rated_movies.dart';

final locator = GetIt.instance;

Future<void> init() async {

  final GoogleSignIn googleSignIn = GoogleSignIn();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final ApiServices apiServices = ApiServices();

  final database = await $FloorAppDatabase.databaseBuilder('app_database.db')
      .build();

  locator.registerLazySingleton(() => googleSignIn);
  locator.registerLazySingleton(() => firebaseAuth);
  locator.registerLazySingleton(() => apiServices);
  locator.registerLazySingleton(() => database.movieDao);

  locator.registerLazySingleton(
          () => AccountCubit(locator(), locator(), locator(), locator()));
  locator.registerLazySingleton(
          () => MovieCubit(
            locator(),
            locator(),
            locator(),
            locator(),
            locator(),
            locator(),
            locator()
          ));

  locator.registerLazySingleton(() => DoSignIn(locator()));
  locator.registerLazySingleton(() => DoCheckSignInStatus(locator()));
  locator.registerLazySingleton(() => GetNowPlayingMovies(locator()));
  locator.registerLazySingleton(() => GetTopRatedMovies(locator()));
  locator.registerLazySingleton(() => GetPopularMovies(locator()));
  locator.registerLazySingleton(() => AddMovieToFavorite(locator()));
  locator.registerLazySingleton(() => DeleteMovieFromFavorite(locator()));
  locator.registerLazySingleton(() => GetFavoriteMovieById(locator()));
  locator.registerLazySingleton(() => GetListFavoriteMovies(locator()));
  locator.registerLazySingleton(() => GetAccount(locator()));
  locator.registerLazySingleton(() => DoSignOut(locator()));

  locator.registerLazySingleton<AccountRepository>(
          () => AccountRepositoryImpl(locator()));
  locator.registerLazySingleton<MovieRepository>(
          () => MovieRepositoryImpl(locator(), locator()));

  locator.registerLazySingleton<AccountRemoteDataSource>(
          () => AccountRemoteDataSourceImpl(locator(), locator()));
  locator.registerLazySingleton<MovieRemoteDataSource>(
          () => MovieRemoteDataSourceImpl(locator()));

  locator.registerLazySingleton<MovieLocalDataSource>(
          () => MovieLocalDataSourceImpl(locator()));

}