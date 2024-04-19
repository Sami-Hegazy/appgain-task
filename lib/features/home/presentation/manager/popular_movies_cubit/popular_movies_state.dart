part of 'popular_movies_cubit.dart';

abstract class PopularMoviesState extends Equatable {
  const PopularMoviesState();

  @override
  List<Object> get props => [];
}

class PopularMoviesInitial extends PopularMoviesState {}

class PopularMoviesLoading extends PopularMoviesState {}

class PopularMoviesFailure extends PopularMoviesState {
  final String errorMessage;

  const PopularMoviesFailure(this.errorMessage);
}

class PopularMoviesSuccess extends PopularMoviesState {
  final List<Movie> movies;

  const PopularMoviesSuccess(this.movies);
}
