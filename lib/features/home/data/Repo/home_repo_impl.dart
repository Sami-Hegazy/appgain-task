import 'package:appgain_task/core/errors/failures.dart';
import 'package:appgain_task/core/utils/api_constant.dart';
import 'package:appgain_task/core/utils/api_service.dart';
import 'package:appgain_task/features/home/data/Repo/home_repo.dart';
import 'package:appgain_task/features/home/data/models/movie.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class HomeRepoImp implements HomeRepo {
  final ApiService apiService;

  HomeRepoImp(this.apiService);

  @override
  Future<Either<Failure, List<Movie>>> fetchPopularMovies() async {
    try {
      var data = await apiService.get(
          endPoint: '/popular?api_key=${ApiConstant.apiKey}');
      List<Movie> movies = [];
      for (var i in data['results']) {
        try {
          movies.add(Movie.fromJson(i));
        } catch (e) {
          debugPrint(i);
        }
      }
      return right(movies);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> fetchTopRelatedMovies() async {
    try {
      var data = await apiService.get(
          endPoint: '/top_rated?api_key=${ApiConstant.apiKey}');
      List<Movie> movies = [];
      for (var i in data['results']) {
        movies.add(Movie.fromJson(i));
      }
      return right(movies);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }
}
