import 'package:appgain_task/core/utils/api_constant.dart';
import 'package:appgain_task/core/utils/app_routes.dart';
import 'package:appgain_task/features/home/data/models/movie.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PopularSlider extends StatelessWidget {
  // final AsyncSnapshot snapshot;
  final Movie movie;
  const PopularSlider({
    super.key,
    required this.movie,
    // required this.snapshot,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.push(context, MaterialPageRoute(
        //   builder: (context) {
        //     return Details(movie: movie.data[index]);
        //   },
        // ));
        GoRouter.of(context).push(AppRoutes.kDetailsView, extra: movie);
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: SizedBox(
          height: 260,
          width: 170,
          child: Image.network(
            filterQuality: FilterQuality.high,
            fit: BoxFit.cover,
            '${ApiConstant.imagePath}${movie.poster_path}',
          ),
        ),
      ),
    );
  }
}
