import 'package:movies/mainLayout/data/model/MovieModel.dart';
import '../../../presentation/screen/home_screen/widget/cast_model.dart';
import 'movie_states.dart';

class MovieSuccessStateWithDetails extends MovieStates {
  final Movies movieDetails;

  MovieSuccessStateWithDetails(this.movieDetails);
}

class MovieDetailsWithCastState extends MovieStates {
  final Movies movieDetails;
  final List<CastModel> castList;

  MovieDetailsWithCastState({
    required this.movieDetails,
    required this.castList,
  });
}
