import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomWidget extends StatelessWidget {
  final double width;
  final double height;
  final ShapeBorder shapeBorder;

  const CustomWidget.rectangular(
      {super.key, this.width = double.infinity, required this.height})
      : shapeBorder = const RoundedRectangleBorder();

  const CustomWidget.circular(
      {super.key,
      this.width = double.infinity,
      required this.height,
      this.shapeBorder = const CircleBorder()});

  @override
  Widget build(BuildContext context) => Shimmer.fromColors(
        baseColor: Colors.grey.shade400,
        highlightColor: Colors.grey[200]!,
        period: const Duration(seconds: 2),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Container(
            width: width,
            height: height,
            decoration: ShapeDecoration(
              color: Colors.grey[400]!,
              shape: shapeBorder,
            ),
          ),
        ),
      );
}

class BuildListTileShimmer extends StatelessWidget {
  const BuildListTileShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CustomWidget.rectangular(height: 100, width: 80),
      title: Align(
        alignment: Alignment.centerLeft,
        child: CustomWidget.rectangular(
          height: 16,
          width: MediaQuery.of(context).size.width * 0.3,
        ),
      ),
      subtitle: const CustomWidget.rectangular(height: 14),
    );
  }
}

class BuildListViewShimmer extends StatelessWidget {
  const BuildListViewShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.width * 0.4,
      margin: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          AspectRatio(
            aspectRatio: 2.5 / 4,
            child: CustomWidget.rectangular(
                height: MediaQuery.of(context).size.width * 0.4),
          ),
          const SizedBox(width: 24),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: CustomWidget.rectangular(
                      height: 16,
                      width: MediaQuery.of(context).size.width * 0.8,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: CustomWidget.rectangular(
                      height: 16,
                      width: MediaQuery.of(context).size.width * 0.8,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: CustomWidget.rectangular(
                      height: 16,
                      width: MediaQuery.of(context).size.width * 0.8,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: CustomWidget.rectangular(
                      height: 16,
                      width: MediaQuery.of(context).size.width * 0.8,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class BuildHorizontalListShimmer extends StatelessWidget {
  final double height;
  final double width;
  const BuildHorizontalListShimmer(
      {super.key, required this.height, required this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ListView.builder(
        itemCount: 5,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomWidget.rectangular(
              height: 200,
              width: width,
            ),
          );
        },
      ),
    );
  }
}
