import 'package:flutter/material.dart';
import 'package:movie_wtc/extensions/custom_colors.dart';
import 'package:movie_wtc/extensions/custom_text_styles.dart';
import 'package:movie_wtc/models/download_movie.dart';
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
                        generateTitle(
                            context, downloadMovieCellProvider.downloadMovie),
                        const SizedBox(height: 8),
                        Text.rich(
                          TextSpan(
                            text: '${movie.details} | ',
                            children: [
                              TextSpan(
                                text: generateDescription(
                                    downloadMovie:
                                        downloadMovieCellProvider.downloadMovie,
                                    movie: movie),
                                style: downloadMovieCellProvider
                                            .downloadMovie?.state ==
                                        DownloadMovieState.downloading
                                    ? CustomTextStyles.of(context).regular10
                                    : null,
                              ),
                            ],
                          ),
                          style: CustomTextStyles.of(context)
                              .regular10
                              .apply(color: CustomColors.of(context).inactive),
                        ),
                      ],
                    ),
                  ),
                  generateActionIcon(
                      context, downloadMovieCellProvider.downloadMovie),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  String generateDescription(
      {DownloadMovie? downloadMovie, required Movie movie}) {
    final String additionalDetails;
    final size = movie.fileSize / 1024.0 / 1024.0
      ..round();
    if (downloadMovie?.state == DownloadMovieState.downloading) {
      final downloadedSize = downloadMovie!.downloadedSize / 1024.0 / 1024.0
        ..round();
      additionalDetails =
          '${downloadedSize.toStringAsFixed(0)}/${size.toStringAsFixed(0)}MB';
    } else {
      final size = movie.fileSize / 1024.0 / 1024.0;
      additionalDetails =
          '${movie.length.toStringAsFixed(0)}min | ${size.round()}MB';
    }
    return additionalDetails;
  }

  Widget generateActionIcon(
      BuildContext context, DownloadMovie? downloadMovie) {
    final Widget widget;
    if (downloadMovie == null) {
      widget = Image.asset('assets/icons/icon_download.png');
    } else {
      switch (downloadMovie.state) {
        case DownloadMovieState.pending:
          widget = Image.asset('assets/icons/icon_download.png');
          break;
        case DownloadMovieState.downloading:
          widget = Padding(
            padding: const EdgeInsets.only(right: 24.0),
            child: Center(
              child: SizedBox(
                height: 24,
                width: 24,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: CustomColors.of(context).primary,
                ),
              ),
            ),
          );
          break;
        case DownloadMovieState.downloaded:
          widget = Image.asset('assets/icons/icon_arrow_right.png');
          break;
      }
    }
    return widget;
  }

  Widget generateTitle(BuildContext context, DownloadMovie? downloadMovie) {
    final String titleString;
    if (downloadMovie?.state == DownloadMovieState.downloading) {
      final percent =
          downloadMovie!.downloadedSize / downloadMovie.movie.fileSize;
      titleString = '${movie.title} (${(percent * 100).toStringAsFixed(0)}%)';
    } else {
      titleString = movie.title;
    }
    return Text(
      titleString,
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
      style: CustomTextStyles.of(context).medium14,
    );
  }
}
