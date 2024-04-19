import 'package:appgain_task/core/utils/service_locator.dart';
import 'package:appgain_task/features/details/details.dart';
import 'package:appgain_task/features/home/data/Repo/home_repo_impl.dart';
import 'package:appgain_task/features/home/data/models/movie.dart';
import 'package:appgain_task/features/home/presentation/manager/popular_movies_cubit/popular_movies_cubit.dart';
import 'package:appgain_task/features/home/presentation/view/home.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRoutes {
  static const kHomeView = '/';
  static const kDetailsView = '/DetailsView';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: kHomeView,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: kDetailsView,
        builder: (context, state) => BlocProvider(
          create: (context) => PopularMoviesCubit(getIt.get<HomeRepoImp>()),
          child: Details(movie: state.extra as Movie),
        ),
      )
    ],
  );
}
