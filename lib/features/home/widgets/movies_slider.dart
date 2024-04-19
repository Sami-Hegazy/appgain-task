import 'package:appgain_task/features/details/details.dart';
import 'package:appgain_task/utils/constant.dart';
import 'package:flutter/material.dart';

class MoviesSlider extends StatelessWidget {
  final AsyncSnapshot snapshot;

  const MoviesSlider({
    super.key,
    required this.snapshot,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        itemCount: snapshot.data!.length,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return Details(movie: snapshot.data[index]);
                  },
                ));
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: SizedBox(
                  height: 200,
                  width: 150,
                  child: Image.network(
                    filterQuality: FilterQuality.high,
                    fit: BoxFit.cover,
                    '${Constant.imagePath}${snapshot.data[index].poster_path}',
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
