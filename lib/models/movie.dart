class Movie {
  final String title;
  final String backdrop_path;
  final String original_title;
  final String overview;
  final String poster_path;
  final String release_date;
  final double vote_average;

  Movie({
    required this.title,
    required this.backdrop_path,
    required this.original_title,
    required this.overview,
    required this.poster_path,
    required this.release_date,
    required this.vote_average,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      title: json['title'],
      backdrop_path: json['backdrop_path'],
      original_title: json['original_title'],
      overview: json['overview'],
      poster_path: json['poster_path'],
      release_date: json['release_date'],
      vote_average: json['vote_average'],
    );
  }

  Map<String, dynamic> toJson() => {
        'title': title,
        'backdrop_path': backdrop_path,
        'original_title': original_title,
        'overview': overview,
        'poster_path': poster_path,
        'release_date': release_date,
        'vote_average': vote_average,
      };
}
