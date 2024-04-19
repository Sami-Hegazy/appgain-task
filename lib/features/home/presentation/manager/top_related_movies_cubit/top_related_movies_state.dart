part of 'top_related_movies_cubit.dart';

abstract class TopRelatedMoviesState extends Equatable {
  const TopRelatedMoviesState();

  @override
  List<Object> get props => [];
}

class TopRelatedMoviesInitial extends TopRelatedMoviesState {}

class TopRelatedMoviesLoading extends TopRelatedMoviesState {}

class TopRelatedMoviesSuccess extends TopRelatedMoviesState {
  final List<Movie> movies;

  const TopRelatedMoviesSuccess(this.movies);
}

class TopRelatedMoviesFailure extends TopRelatedMoviesState {
  final String errorMessage;

  const TopRelatedMoviesFailure(this.errorMessage);
}
