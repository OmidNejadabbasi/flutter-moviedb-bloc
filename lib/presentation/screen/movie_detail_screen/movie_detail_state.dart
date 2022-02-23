import 'package:movies_app/data/json/movie_detail_json.dart';

class MovieDetailState {}


class MovieDetailLoaded extends MovieDetailState {
  MovieDetailJson get moviesDetail => _movieDetail;
  final MovieDetailJson _movieDetail;

  MovieDetailLoaded(this._movieDetail);
}

class DetailLoadingState extends MovieDetailState {}

class HasErrorState extends MovieDetailState {
  Error error;

  HasErrorState(this.error);
}
