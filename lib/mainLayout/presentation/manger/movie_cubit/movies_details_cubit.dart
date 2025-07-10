import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:movies/mainLayout/data/model/MovieModel.dart';
import '../../../../authentication/error_handler/ErrorHandler.dart';
import '../../../data/data_repositories/movie_repositories/movie_repositories.dart';
import '../movie_states/movie_states.dart';
import '../movie_states/movies_details_states.dart';
import '../../screen/home_screen/widget/cast_model.dart';

class MovieDetailsCubit extends Cubit<MovieStates> {
  final MovieRepositories movieRepositories;

  MovieDetailsCubit(this.movieRepositories) : super(MovieInitialState());

  Movies? movieDetails;
  List<CastModel> castList = [];

  Future<void> getMovieDetails(int movieId) async {
    emit(MovieLoadingState());

    // أولًا: تحميل تفاصيل الفيلم
    final Either<ErrorHandler, Movies> detailsResult =
    await movieRepositories.getMovieDetails(movieId);

    await detailsResult.fold(
          (error) async {
        emit(MovieErrorState(error.message ?? "Failed to load movie details"));
      },
          (details) async {
        movieDetails = details;

        // ثانيًا: تحميل الطاقم (cast)
        final Either<ErrorHandler, List<CastModel>> castResult =
        await movieRepositories.getMovieCast(movieId);

        castResult.fold(
              (error) {
            emit(MovieErrorState(error.message ?? "Failed to load cast"));
          },
              (cast) {
            castList = cast;
            emit(
              MovieDetailsWithCastState(
                movieDetails: details,
                castList: cast,
              ),
            );
          },
        );
      },
    );
  }
}
