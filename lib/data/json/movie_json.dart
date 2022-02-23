

class MovieJson {

  final int? id;
  final bool? adult;
  final String? title;
  final String? originalTitle;
  final String? originalLanguage;
  final double? popularity;
  final String? posterPath;



  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'adult': adult,
      'id': id,
      'originalTitle': originalTitle,
      'originalLanguage': originalLanguage,
      'popularity': popularity,
      'posterPath': posterPath,
    };
  }

  factory MovieJson.fromJsonMap(Map<String, dynamic> map) {
    return MovieJson(
      title: map['title'] as String,
      adult: map['adult'] as bool,
      id: map['id'] as int,
      originalTitle: map['original_title'] as String,
      originalLanguage: map['original_language'] as String,
      popularity: map['popularity'] as double,
      posterPath: map['poster_path'] as String,
    );
  }

  MovieJson({
    this.title,
    this.adult,
    this.id,
    this.originalTitle,
    this.originalLanguage,
    this.popularity,
    this.posterPath,
  });
}