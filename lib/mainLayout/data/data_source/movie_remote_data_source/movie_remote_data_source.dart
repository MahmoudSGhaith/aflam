import 'package:movies/mainLayout/data/model/MovieModel.dart';

import '../../../presentation/screen/home_screen/widget/cast_model.dart';

abstract class MovieRemoteDataSource {
  Future<MovieModel> getMovies();
  Future<Movies> getMovieDetails(int movieId);
  Future<List<CastModel>> getMovieCast(int movieId);
}
