import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../authentication/error_handler/ErrorHandler.dart';
import '../../../presentation/screen/home_screen/widget/cast_model.dart';
import '../../data_source/movie_remote_data_source/movie_remote_data_source.dart';
import '../../model/MovieModel.dart';
import '../movie_repositories/movie_repositories.dart';

@LazySingleton(as: MovieRepositories)
class MovieRepositoriesImpl implements MovieRepositories {
  final MovieRemoteDataSource movieRemoteDataSource;

  MovieRepositoriesImpl(this.movieRemoteDataSource);

  @override
  Future<Either<ErrorHandler, MovieModel>> fetchMovies() async {
    try {
      final result = await movieRemoteDataSource.getMovies();
      return Right(result);
    } on DioException catch (error) {
      return Left(ErrorHandler.fromJson(error.response?.data ?? {}));
    } catch (error, s) {
      print(error);
      print(s);
      rethrow;
    }
  }

  @override
  Future<Either<ErrorHandler, Movies>> getMovieDetails(int movieId) async {
    try {
      final result = await movieRemoteDataSource.getMovieDetails(movieId);
      return Right(result);
    } on DioException catch (error) {
      return Left(ErrorHandler.fromJson(error.response?.data ?? {}));
    } catch (error, s) {
      print(error);
      print(s);
      rethrow;
    }
  }

  @override
  Future<Either<ErrorHandler, List<CastModel>>> getMovieCast(int movieId) async {
    try {
      final result = await movieRemoteDataSource.getMovieCast(movieId);
      return Right(result);
    } on DioException catch (error) {
      return Left(ErrorHandler.fromJson(error.response?.data ?? {}));
    } catch (error, s) {
      print(error);
      print(s);
      rethrow;
    }
  }
}
