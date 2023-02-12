import 'package:flutter/material.dart';
import 'package:my_movie_list_v2/core/constants.dart';
import 'package:my_movie_list_v2/core/widgets/image_viewer.dart';
import 'package:my_movie_list_v2/data/model/movie/movie.dto.dart';

class ListItem extends StatelessWidget {
  const ListItem({super.key, required this.title, required this.items, required this.onViewMore, required this.onViewItem});

  final String title;
  final List<MovieDto> items;
  final Function() onViewMore;
  final Function(MovieDto) onViewItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 16, right: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                IconButton(
                  onPressed: onViewMore,
                  icon: const Icon(Icons.arrow_circle_right_outlined),
                ),
              ],
            ),
          ),
          const SizedBox(height: 4),
          SizedBox(
            height: 250,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.only(left: 16),
              scrollDirection: Axis.horizontal,
              itemCount: items.length,
              itemBuilder: (context, index) {
                final movie = items[index];

                return Container(
                  margin: const EdgeInsets.only(right: 16),
                  width: 150,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: CustomImageViewer(
                            url: AppConstant.baseImageUrl(path: movie.posterPath ?? ""),
                          ),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        movie.title ?? "",
                        style: Theme.of(context).textTheme.titleMedium,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Row(
                        children: [
                          Text(movie.releaseDate ?? ""),
                          const SizedBox(width: 4),
                          Text(movie.voteAverage.toString()),
                        ],
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
