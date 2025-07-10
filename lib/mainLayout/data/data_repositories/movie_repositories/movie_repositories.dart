import 'package:dartz/dartz.dart';
import 'package:movies/mainLayout/data/model/MovieModel.dart';
import '../../../../authentication/error_handler/ErrorHandler.dart';
import '../../../presentation/screen/home_screen/widget/cast_model.dart';

abstract class MovieRepositories {
  Future<Either<ErrorHandler, MovieModel>> fetchMovies();

  Future<Either<ErrorHandler, Movies>> getMovieDetails(int movieId);

  Future<Either<ErrorHandler, List<CastModel>>> getMovieCast(int movieId);
}
