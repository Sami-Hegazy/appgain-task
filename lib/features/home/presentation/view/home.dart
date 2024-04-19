import 'package:appgain_task/core/utils/functions/connectivity_check.dart';
import 'package:appgain_task/features/home/presentation/manager/popular_movies_cubit/popular_movies_cubit.dart';
import 'package:appgain_task/features/home/presentation/manager/top_related_movies_cubit/top_related_movies_cubit.dart';
import 'package:appgain_task/features/home/presentation/view/widgets/custom_error_widget.dart';
import 'package:appgain_task/features/home/presentation/view/widgets/popular_slider.dart';
import 'package:appgain_task/features/home/presentation/view/widgets/movies_slider.dart';
import 'package:appgain_task/features/home/presentation/view/widgets/simmer.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
      body: RefreshIndicator(
        onRefresh: () async {
          connectivityCheck();
          context.read<PopularMoviesCubit>().fetchPopularMovies();
          context.read<TopRelatedMoviesCubit>().fetchTopRelatedMovies();
        },
        child: SingleChildScrollView(
          // physics: const BouncingScrollPhysics(),
          physics: const AlwaysScrollableScrollPhysics(),

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
                child: BlocBuilder<PopularMoviesCubit, PopularMoviesState>(
                  builder: (context, state) {
                    if (state is PopularMoviesSuccess) {
                      return SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: CarouselSlider.builder(
                          itemCount: state.movies.length,
                          itemBuilder: (context, index, realIndex) {
                            return PopularSlider(movie: state.movies[index]);
                          },
                          options: CarouselOptions(
                            autoPlay: true,
                            height: 260,
                            enlargeCenterPage: true,
                            pageSnapping: true,
                            viewportFraction: 0.55,
                            autoPlayCurve: Curves.fastOutSlowIn,
                            autoPlayAnimationDuration:
                                const Duration(seconds: 2),
                          ),
                        ),
                      );
                    } else if (state is PopularMoviesFailure) {
                      return CustomErrorWidget(
                          errorMessage: state.errorMessage);
                    } else {
                      return const BuildHorizontalListShimmer(
                        width: 170,
                        height: 260,
                      );
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
              SizedBox(
                child:
                    BlocBuilder<TopRelatedMoviesCubit, TopRelatedMoviesState>(
                  builder: (context, state) {
                    if (state is TopRelatedMoviesSuccess) {
                      return SizedBox(
                        height: 200,
                        width: MediaQuery.of(context).size.width,
                        child: ListView.builder(
                          itemCount: state.movies.length,
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return MoviesSlider(movie: state.movies[index]);
                          },
                        ),
                      );
                    } else if (state is TopRelatedMoviesFailure) {
                      return CustomErrorWidget(
                          errorMessage: state.errorMessage);
                    } else {
                      return const BuildHorizontalListShimmer(
                        width: 150,
                        height: 200,
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
