



class MovieDetailJson {

  List<String>? genres;
  int? budget;
  String? overview;
  String? origLanguage;
  double? popularity;
  String? releaseDate;
  int? revenue;
  double? voteAverage;
  int? voteCount;
  String? title;

//<editor-fold desc="Data Methods">

  MovieDetailJson({
    this.genres,
    this.budget,
    this.origLanguage,
    this.popularity,
    this.releaseDate,
    this.revenue,
    this.voteAverage,
    this.voteCount,
    this.title,
    this.overview,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MovieDetailJson &&
          runtimeType == other.runtimeType &&
          genres == other.genres &&
          budget == other.budget &&
          origLanguage == other.origLanguage &&
          popularity == other.popularity &&
          releaseDate == other.releaseDate &&
          revenue == other.revenue &&
          voteAverage == other.voteAverage &&
          voteCount == other.voteCount &&
          overview == other.overview &&
          title == other.title);

  @override
  int get hashCode =>
      genres.hashCode ^
      budget.hashCode ^
      origLanguage.hashCode ^
      popularity.hashCode ^
      releaseDate.hashCode ^
      revenue.hashCode ^
      voteAverage.hashCode ^
      voteCount.hashCode ^
      title.hashCode;

  @override
  String toString() {
    return 'MovieDetailJson{' +
        ' genres: $genres,' +
        ' budget: $budget,' +
        ' origLanguage: $origLanguage,' +
        ' popularity: $popularity,' +
        ' releaseDate: $releaseDate,' +
        ' revenue: $revenue,' +
        ' voteAverage: $voteAverage,' +
        ' voteCount: $voteCount,' +
        ' title: $title,' +
        '}';
  }

  MovieDetailJson copyWith({
    List<String>? genres,
    int? budget,
    String? origLanguage,
    double? popularity,
    String? releaseDate,
    int? revenue,
    double? voteAverage,
    int? voteCount,
    String? title,
  }) {
    return MovieDetailJson(
      genres: genres ?? this.genres,
      budget: budget ?? this.budget,
      origLanguage: origLanguage ?? this.origLanguage,
      popularity: popularity ?? this.popularity,
      releaseDate: releaseDate ?? this.releaseDate,
      revenue: revenue ?? this.revenue,
      voteAverage: voteAverage ?? this.voteAverage,
      voteCount: voteCount ?? this.voteCount,
      title: title ?? this.title,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'overview': overview,
      'genres': genres,
      'budget': budget,
      'origLanguage': origLanguage,
      'popularity': popularity,
      'releaseDate': releaseDate,
      'revenue': revenue,
      'voteAverage': voteAverage,
      'voteCount': voteCount,
      'title': title,
    };
  }

  factory MovieDetailJson.fromJson(Map<String, dynamic> map) {
    List<String>? genres = (map['genres'] as List).map((e) => e['name'] as String).toList();

    return MovieDetailJson(
      genres: genres,
      budget: map['budget'] as int,
      overview: map['overview'],
      origLanguage: map['original_language'] as String,
      popularity: map['popularity'] as double,
      releaseDate: map['release_date'] as String,
      revenue: map['revenue'] as int,
      voteAverage: map['vote_average'] as double,
      voteCount: map['vote_count'] as int,
      title: map['title'] as String,
    );
  }

//</editor-fold>
}


