import 'package:appgain_task/core/utils/api_constant.dart';
import 'package:appgain_task/core/utils/app_routes.dart';
import 'package:appgain_task/features/home/data/models/movie.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MoviesSlider extends StatelessWidget {
  // final AsyncSnapshot snapshot;
  final Movie movie;
  const MoviesSlider({
    super.key,
    required this.movie,
    // required this.snapshot,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          // Navigator.push(context, MaterialPageRoute(
          //   builder: (context) {
          //     return Details(movie: snapshot.data[index]);
          //   },
          // ));
          GoRouter.of(context).push(AppRoutes.kDetailsView, extra: movie);
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: SizedBox(
            height: 200,
            width: 150,
            child: Image.network(
              filterQuality: FilterQuality.high,
              fit: BoxFit.cover,
              '${ApiConstant.imagePath}${movie.poster_path}',
            ),
          ),
        ),
      ),
    );
  }
}
