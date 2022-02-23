import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movies_app/data/json/movie_detail_json.dart';
import 'package:movies_app/data/json/movie_json.dart';
import 'package:movies_app/data/repository/movie_repo.dart';
import 'package:movies_app/presentation/screen/movie_detail_screen/movie_detail_actions.dart';
import 'package:movies_app/presentation/screen/movie_detail_screen/movie_detail_state.dart';
import 'package:rxdart/rxdart.dart';

class MovieDetailBloc {

  Sink get actions => _actions.sink;
  final _actions = StreamController();

  final BehaviorSubject<MovieDetailState> _state = BehaviorSubject.seeded(DetailLoadingState());
  Stream<MovieDetailState> get state => _state.stream;


  MovieDetailBloc(){


    _actions.stream.listen((event) {
      switch(event.runtimeType){
        case LoadMovieDetail:
          loadMovieDetail(event.movieId);

      }
    });
  }

  void loadMovieDetail(int movieId) async {
    try {
      _state.add(DetailLoadingState());
      var movieDetailJson = await MovieRepository.getMovieDetail(movieId);
      _state.add(MovieDetailLoaded(movieDetailJson));
    }catch (err){
      _state.add(HasErrorState(err as Error));
      debugPrint(err.toString());
    }

  }
}
