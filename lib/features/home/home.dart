import 'package:appgain_task/features/home/widgets/popular_slider.dart';
import 'package:appgain_task/features/home/widgets/movies_slider.dart';
import 'package:appgain_task/models/movie.dart';
import 'package:appgain_task/service/api.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Movie>> popularMovies;
  late Future<List<Movie>> topRelatedMovies;

  @override
  void initState() {
    super.initState();
    popularMovies = Api().getPopularMovies();
    topRelatedMovies = Api().getTopRelatedMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Movies',
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Popular',
                style: GoogleFonts.aBeeZee(fontSize: 25),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              child: FutureBuilder(
                future: popularMovies,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return PopularSlider(snapshot: snapshot);
                  } else if (snapshot.hasError) {
                    return Center(child: Text(snapshot.error.toString()));
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Top Related Movies',
                style: GoogleFonts.roboto(fontSize: 18),
              ),
            ),
            // const SizedBox(height: 8),
            SizedBox(
              child: FutureBuilder(
                future: topRelatedMovies,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(child: Text(snapshot.error.toString()));
                  } else if (snapshot.hasData) {
                    return MoviesSlider(snapshot: snapshot);
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
