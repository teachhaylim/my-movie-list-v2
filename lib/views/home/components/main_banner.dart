import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:my_movie_list_v2/core/config/colors.dart';
import 'package:my_movie_list_v2/core/constants.dart';
import 'package:my_movie_list_v2/core/widgets/image_viewer.dart';
import 'package:my_movie_list_v2/data/model/movie/movie.dto.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MainBanner extends StatefulWidget {
  const MainBanner({super.key, required this.movies});

  final List<MovieDto> movies;

  @override
  State<MainBanner> createState() => _MainBannerState();
}

class _MainBannerState extends State<MainBanner> {
  late List<MovieDto> movies;
  int imageIndex = 0;

  @override
  void initState() {
    super.initState();
    movies = widget.movies;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          margin: const EdgeInsets.only(left: 16, right: 16),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: CarouselSlider(
              options: CarouselOptions(
                height: 200,
                viewportFraction: 1,
                initialPage: imageIndex,
                enableInfiniteScroll: false,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 8),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                enlargeFactor: 0.4,
                onPageChanged: (index, _) => setState(() => imageIndex = index),
                scrollDirection: Axis.horizontal,
              ),
              items: [
                ...List.generate(
                  movies.length,
                  (index) {
                    final movie = movies[index];

                    return Stack(
                      alignment: Alignment.bottomLeft,
                      children: [
                        CustomImageViewer(
                          url: AppConstant.baseImageUrl(path: movie.backdropPath ?? ""),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.transparent,
                                Colors.transparent,
                                Colors.black.withOpacity(0.4),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8, bottom: 16),
                          child: Text(
                            movie.title ?? "",
                            style: Theme.of(context).textTheme.titleMedium?.copyWith(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 8),
          child: AnimatedSmoothIndicator(
            activeIndex: imageIndex,
            count: movies.length,
            effect: WormEffect(
              activeDotColor: AppColor.primaryColor,
              dotColor: AppColor.grayColor,
              dotHeight: 4,
              dotWidth: (MediaQuery.of(context).size.width / movies.length) - 16,
            ),
          ),
        ),
      ],
    );
  }
}
