import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/mainLayout/data/model/MovieModel.dart';
import '../../../presentation/screen/home_screen/widget/cast_model.dart';
import '../movie_remote_data_source/movie_remote_data_source.dart';

@LazySingleton(as: MovieRemoteDataSource)
class MovieRemoteDataSourceImpl implements MovieRemoteDataSource {
  final Dio dio;

  MovieRemoteDataSourceImpl(this.dio);

  @override
  Future<MovieModel> getMovies() async {
    final response = await dio.get('https://yts.mx/api/v2/list_movies.json');
    return MovieModel.fromJson(response.data);
  }

  @override
  Future<Movies> getMovieDetails(int movieId) async {
    final response = await dio.get(
      'https://yts.mx/api/v2/movie_details.json',
      queryParameters: {'movie_id': movieId},
    );
    return Movies.fromJson(response.data['data']['movie']);
  }

  @override
  Future<List<CastModel>> getMovieCast(int movieId) async {
    final response = await dio.get(
      'https://yts.mx/api/v2/movie_cast.json',
      queryParameters: {'movie_id': movieId},
    );

    final castJsonList = response.data['data']['cast'] as List<dynamic>?;

    if (castJsonList != null) {
      return CastModel.fromJsonList(castJsonList);
    } else {
      return [];
    }
  }
}
