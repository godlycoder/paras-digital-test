import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paras_test/app/cubit/account/account_cubit.dart';
import 'package:paras_test/app/cubit/movie/movie_cubit.dart';
import 'package:paras_test/router/router.gr.dart';
import 'package:paras_test/injection.dart' as di;

final _appRouter = AppRouter();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await di.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => di.locator<AccountCubit>()
        ),
        BlocProvider(
          create: (_) => di.locator<MovieCubit>()
        )
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        useInheritedMediaQuery: true,
        routerDelegate: _appRouter.delegate(),
        routeInformationParser: _appRouter.defaultRouteParser(),
      )
    );
  }
}
