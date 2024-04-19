import 'package:appgain_task/features/home/data/Repo/home_repo.dart';
import 'package:appgain_task/features/home/data/models/movie.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
part 'top_related_movies_state.dart';

class TopRelatedMoviesCubit extends Cubit<TopRelatedMoviesState> {
  TopRelatedMoviesCubit(this.homeRepo) : super(TopRelatedMoviesInitial());
  HomeRepo homeRepo;

  Future<void> fetchTopRelatedMovies() async {
    emit(TopRelatedMoviesLoading());
    var result = await homeRepo.fetchTopRelatedMovies();
    result.fold((failure) {
      emit(TopRelatedMoviesFailure(failure.errMessage));
    }, (movies) {
      emit(TopRelatedMoviesSuccess(movies));
    });
  }
}
