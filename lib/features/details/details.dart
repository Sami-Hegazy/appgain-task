import 'package:appgain_task/core/utils/api_constant.dart';
import 'package:appgain_task/core/utils/colors.dart';
import 'package:appgain_task/features/details/widgets/back_button.dart';
import 'package:appgain_task/features/home/data/models/movie.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Details extends StatelessWidget {
  final Movie movie;

  const Details({super.key, required this.movie});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            backgroundColor: ColorsApp.scaffoldBgColor,
            leading: const CustomBackButton(),
            expandedHeight: 500,
            pinned: true,
            floating: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                movie.title,
                style: GoogleFonts.belleza(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                ),
              ),
              background: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24),
                ),
                child: Image.network(
                  '${ApiConstant.imagePath}${movie.backdrop_path}',
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  Text(
                    'Overview',
                    style: GoogleFonts.belleza(
                      fontSize: 32,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    '$movie.overview\n$dummyText',
                    style: GoogleFonts.belleza(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 40,
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.grey),
                          ),
                          child: Row(
                            children: [
                              Text(
                                'Release Date : ',
                                style: GoogleFonts.roboto(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                movie.release_date,
                                style: GoogleFonts.roboto(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(width: 12),
                        Container(
                          height: 40,
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.grey),
                          ),
                          child: Row(
                            children: [
                              Text(
                                'Rating',
                                style: GoogleFonts.roboto(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(width: 6),
                              const Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 18,
                              ),
                              const SizedBox(width: 6),
                              Text(
                                '${movie.vote_average.toStringAsFixed(1)}/10',
                                style: GoogleFonts.roboto(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
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

String dummyText = """
"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."

this text is commonly used as a placeholder to demonstrate the layout and typography of a document or webpage without distracting the viewer with meaningful content.

""";
