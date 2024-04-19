import 'package:appgain_task/core/utils/app_routes.dart';
import 'package:appgain_task/core/utils/colors.dart';
import 'package:appgain_task/core/utils/functions/connectivity_check.dart';
import 'package:appgain_task/core/utils/service_locator.dart';
import 'package:appgain_task/features/home/data/Repo/home_repo_impl.dart';
import 'package:appgain_task/features/home/presentation/manager/popular_movies_cubit/popular_movies_cubit.dart';
import 'package:appgain_task/features/home/presentation/manager/top_related_movies_cubit/top_related_movies_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  connectivityCheck();
  setupServiceLocator();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PopularMoviesCubit(getIt.get<HomeRepoImp>())
            ..fetchPopularMovies(),
        ),
        BlocProvider(
          create: (context) => TopRelatedMoviesCubit(getIt.get<HomeRepoImp>())
            ..fetchTopRelatedMovies(),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'MoviesApp',
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: ColorsApp.scaffoldBgColor,
        ),
        routerConfig: AppRoutes.router,
      ),
    );
  }
}
