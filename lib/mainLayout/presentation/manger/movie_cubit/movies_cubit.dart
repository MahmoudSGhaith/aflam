import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/mainLayout/data/model/MovieModel.dart';
import 'package:movies/mainLayout/presentation/manger/movie_states/movie_states.dart';
import '../../../../authentication/error_handler/ErrorHandler.dart';
import '../../../data/data_repositories/movie_repositories/movie_repositories.dart';

@injectable
class MoviesCubit extends Cubit<MovieStates> {
  final MovieRepositories movieRepositories;

  MoviesCubit(this.movieRepositories) : super(MovieInitialState());

  MovieModel? movieModel;

  Future<void> getAllMovies() async {
    emit(MovieLoadingState());

    final Either<ErrorHandler, MovieModel> movies =
    await movieRepositories.fetchMovies();

    movies.fold(
          (error) {
        emit(MovieErrorState(error.message ?? "Something went wrong"));
      },
          (value) {
        movieModel = value;
        emit(MovieSuccessState(value));
      },
    );
  }
}
