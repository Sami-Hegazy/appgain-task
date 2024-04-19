class Constant {
  static const baseUrl = 'https://api.themoviedb.org/3/movie';
  static const popularUrl = '$baseUrl/popular?api_key=$apiKey';

  static const toRelatedUrl = '$baseUrl/top_rated?api_key=$apiKey';
  static const apiKey = 'de12f11f042ee8a0feb6a9786949d2a7';
  static const token =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkZTEyZjExZjA0MmVlOGEwZmViNmE5Nzg2OTQ5ZDJhNyIsInN1YiI6IjY2MjBmZTZiMDIzMWYyMDE2MzExNDYxZCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.Bq3RiS1PBHMZ72-wPY1slh_IDdVF2V-sFMJwuZKByV0';
  static const imagePath = 'https://image.tmdb.org/t/p/w500';
}
