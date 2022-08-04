import 'package:flutter/material.dart';
import 'package:movie_wtc/extensions/custom_text_styles.dart';
import 'package:movie_wtc/models/movie.dart';
import 'package:movie_wtc/providers/download_movie_cell_provider.dart';
import 'package:provider/provider.dart';

class DownloadMovieCell extends StatelessWidget {
  final Movie movie;

  const DownloadMovieCell({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DownloadMovieCellProvider(movie),
      child: Consumer<DownloadMovieCellProvider>(
        builder: (context, downloadMovieCellProvider, child) {
          return GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              downloadMovieCellProvider.startDownload();
            },
            child: Container(
              height: 60,
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 16),
                    child: SizedBox(
                      width: 100,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: Image.asset(
                          movie.coverImage,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          movie.title,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: CustomTextStyles.of(context).medium14,
                        ),
                        const SizedBox(height: 8),
                        // Text(
                        //   downloadsProvider.downloadState[index - 2] == DownloadsState.downloaded
                        //       ? 'Episode 01| Season 04 | 58min | ${index * 35}mb'
                        //       : 'Episode 01| Season 04 | ${(downloadsProvider.value[index - 2] * index * 35).toStringAsFixed(2)}/${index * 35}mb',
                        //   style: CustomTextStyles.of(context).regular10,
                        // ),
                        Text(
                          '50mb',
                          style: CustomTextStyles.of(context).regular10,
                        ),
                      ],
                    ),
                  ),
                  // Padding(
                  //     padding: const EdgeInsets.only(right: 20.0),
                  //     child: downloadsProvider.downloadState[index - 2] == DownloadsState.downloading
                  //         ? CircularProgressIndicator(
                  //       value: downloadsProvider.value[index - 2],
                  //     )
                  //         : Image.asset('assets/icons/icon_arrow_right.png')),
                  Image.asset('assets/icons/icon_arrow_right.png'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
