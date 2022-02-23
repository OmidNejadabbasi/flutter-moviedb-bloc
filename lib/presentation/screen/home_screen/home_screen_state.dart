import 'package:movies_app/data/json/movie_collection_json.dart';

class HomeScreenState {
  MovieCollectionJson? get moviesList => _movies;
  final MovieCollectionJson? _movies;

  HomeScreenState(this._movies);

  HomeScreenState.empty() :this(null);

}


class MovieListState {}
class MoviesLoaded extends MovieListState {

  MovieCollectionJson get moviesList => _movies;
  final MovieCollectionJson _movies;

  MoviesLoaded(this._movies);

}

class LoadingState extends MovieListState {}

class HasErrorState extends MovieListState{
  Exception error;

  HasErrorState(this.error);
}