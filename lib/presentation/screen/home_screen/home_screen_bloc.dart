import 'dart:async';

import 'package:movies_app/data/json/movie_collection_json.dart';
import 'package:movies_app/data/repository/movie_repo.dart';
import 'package:movies_app/presentation/screen/home_screen/home_screen_actions.dart';
import 'package:movies_app/presentation/screen/home_screen/home_screen_state.dart';
import 'package:rxdart/rxdart.dart';

class HomeScreenBloc {
  Sink get actions => _actions.sink;
  final _actions = StreamController();

  Stream<HomeScreenState> get state => _state.stream;
  final _state =
      BehaviorSubject<HomeScreenState>.seeded(HomeScreenState.empty());

  Stream<MovieListState> get listState => _listState.stream;

  final _listState = BehaviorSubject<MovieListState>.seeded(LoadingState());

  HomeScreenBloc() {
    _actions.stream.listen((action) {
      switch (action.runtimeType) {
        case ReloadMovies:
          loadPopularMovies(1);
      }
    });

    loadPopularMovies(1);
  }

  void loadPopularMovies(int page) async {
    MovieCollectionJson? result = null;
    try {
      _listState.add(LoadingState());
      result = await MovieRepository.getPopularMovies(page);
      _listState.add(MoviesLoaded(result));
    } catch (er) {
      if (result == null) {
        _listState.add(HasErrorState(er as Exception));
      }
    }
  }

  void dispose() {
    _state.close();
    _actions.close();
  }
}
