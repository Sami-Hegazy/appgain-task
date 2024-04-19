import 'package:appgain_task/core/errors/failures.dart';
import 'package:appgain_task/features/home/data/models/movie.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<Movie>>> fetchPopularMovies();
  Future<Either<Failure, List<Movie>>> fetchTopRelatedMovies();
}
