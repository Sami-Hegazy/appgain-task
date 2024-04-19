import 'package:appgain_task/features/home/data/Repo/home_repo.dart';
import 'package:appgain_task/features/home/data/models/movie.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'popular_movies_state.dart';

class PopularMoviesCubit extends Cubit<PopularMoviesState> {
  PopularMoviesCubit(this.homeRepo) : super(PopularMoviesInitial());
  HomeRepo homeRepo;

  Future<void> fetchPopularMovies() async {
    emit(PopularMoviesLoading());
    var result = await homeRepo.fetchPopularMovies();
    result.fold((failure) {
      emit(PopularMoviesFailure(failure.errMessage));
    }, (movies) {
      emit(PopularMoviesSuccess(movies));
    });
  }
}
