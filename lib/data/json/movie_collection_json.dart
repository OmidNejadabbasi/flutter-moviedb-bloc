import 'package:movies_app/data/json/movie_json.dart';

class MovieCollectionJson {
  int? total_pages;
  int? page;
  int? totalResults;

  List<MovieJson>? results;

//<editor-fold desc="Data Methods">

  MovieCollectionJson({
    this.total_pages,
    this.page,
    this.totalResults,
    this.results,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MovieCollectionJson &&
          runtimeType == other.runtimeType &&
          total_pages == other.total_pages &&
          page == other.page &&
          totalResults == other.totalResults &&
          results == other.results);

  @override
  int get hashCode =>
      total_pages.hashCode ^
      page.hashCode ^
      totalResults.hashCode ^
      results.hashCode;

  @override
  String toString() {
    return 'MovieCollectionJson{' +
        ' total_pages: $total_pages,' +
        ' page: $page,' +
        ' totalResults: $totalResults,' +
        ' results: $results,' +
        '}';
  }

  MovieCollectionJson copyWith({
    int? total_pages,
    int? page,
    int? totalResults,
    List<MovieJson>? results,
  }) {
    return MovieCollectionJson(
      total_pages: total_pages ?? this.total_pages,
      page: page ?? this.page,
      totalResults: totalResults ?? this.totalResults,
      results: results ?? this.results,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'total_pages': this.total_pages,
      'page': this.page,
      'totalResults': this.totalResults,
      'results': this.results,
    };
  }

  MovieCollectionJson.fromMap(Map<String, dynamic> map) {
    total_pages = map['total_pages'] as int;
    page = map['page'] as int;
    totalResults = map['total_results'] as int;
    List<MovieJson> temp = [];
    for (dynamic obj in map['results']) {
      temp.add(MovieJson.fromJsonMap(obj as Map<String, dynamic>));
    }
    results = temp;
  }

//</editor-fold>
}
