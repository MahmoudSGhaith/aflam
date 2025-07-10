
import '../../../data/model/MovieModel.dart';

abstract class MovieStates {}

class MovieInitialState extends MovieStates {}

class MovieLoadingState extends MovieStates {}

class MovieSuccessState extends MovieStates {
  final MovieModel movieModel;
  MovieSuccessState(this.movieModel);
}

class MovieErrorState extends MovieStates {
  final String errorMessage;
  MovieErrorState(this.errorMessage);
}