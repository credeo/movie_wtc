import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_wtc/extensions/custom_colors.dart';
import 'package:movie_wtc/extensions/custom_text_styles.dart';
import 'package:movie_wtc/models/movie.dart';
import 'package:movie_wtc/providers/movie_cell_provider.dart';
import 'package:provider/provider.dart';

class DownloadBuildCell extends StatelessWidget {
  const DownloadBuildCell({super.key, required this.movie});
  final Movie movie;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DownloadMovieCellProvider(movie),
      child: Consumer<DownloadMovieCellProvider>(
        builder: (context, cellProvider, child) {
          final movie = cellProvider.movie;
          return Padding(
            padding: const EdgeInsets.only(left: 12, right: 8),
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                print('gesture detector click');
                cellProvider.startDownload();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 60,
                        width: 100,
                        margin: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(4),
                          ),
                          child: Image.asset(
                            movie.coverImage,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            movie.title,
                            style: CustomTextStyles.of(context).medium12,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            '${movie.details} | ${movie.duration.toString()}min',
                            style: CustomTextStyles.of(context).regular10.apply(
                                color: CustomColors.of(context).inactive),
                          ),
                          // Text(
                          //   '${movie.details} | ${movie.duration.toString()}min | ${movie.downloadSize.toString()}mb',
                          //   style: CustomTextStyles.of(context)
                          //       .regular10
                          //       .apply(color: CustomColors.of(context).inactive),
                          // ),
                        ],
                      ),
                    ],
                  ),
                  CupertinoButton(
                    child: Icon(Icons.arrow_forward_ios,
                        color: CustomColors.of(context).primaryText),
                    onPressed: () {
                      print('object');
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
