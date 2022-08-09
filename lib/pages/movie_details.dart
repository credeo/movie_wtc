import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:movie_wtc/extensions/custom_colors.dart';
import 'package:movie_wtc/extensions/custom_text_styles.dart';
import 'package:movie_wtc/helpers/snackbar_helper.dart';
import 'package:movie_wtc/providers/movie_details_provider.dart';
import 'package:movie_wtc/widgets/custom_app_bar.dart';
import 'package:movie_wtc/widgets/custom_button_with_icon.dart';
import 'package:movie_wtc/widgets/custom_secondary_button.dart';
import 'package:movie_wtc/widgets/movie_details_row.dart';
import 'package:movie_wtc/widgets/tab_bar_detail.dart';
import 'package:provider/provider.dart';

class MovieDetails extends StatelessWidget {
  static const pageName = 'movie_details';

  final String movieId;

  const MovieDetails({super.key, required this.movieId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.of(context).tertiaryBackground,
      extendBodyBehindAppBar: false,
      appBar: const CustomAppBar(
        hasBackButton: true,
        hasSearchButton: true,
      ),
      body: ChangeNotifierProvider(
        create: (context) => MovieDetailsProvider(movieId),
        child: Consumer<MovieDetailsProvider>(
          builder: (context, movieDetailsProvider, child) {
            return SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                      height: 185,
                      width: MediaQuery.of(context).size.width,
                      child: Image.asset(movieDetailsProvider.movie.coverImage, fit: BoxFit.cover)),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0, top: 24, right: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          movieDetailsProvider.movie.title,
                          style: CustomTextStyles.of(context).semiBold24,
                        ),
                        const SizedBox(height: 12),
                        MovieDetailsRow(
                          leftText: movieDetailsProvider.movie.releaseDate.year.toString(),
                          rightText: '${movieDetailsProvider.movie.rated.toString()}+',
                          tintColor: CustomColors.of(context).inactive,
                          mainAxisAlignment: MainAxisAlignment.start,
                        ),
                        const SizedBox(height: 20),
                        CustomButtonWithIcon(
                          title: 'home_play'.tr(),
                          width: MediaQuery.of(context).size.width - 32.0,
                          iconPath: 'assets/icons/icon_play_filled.png',
                          onPressed: () {},
                        ),
                        const SizedBox(height: 12),
                        CustomButtonWithIcon.secondary(
                          title: '${'detail_download'.tr()} ${movieDetailsProvider.movie.title}',
                          width: MediaQuery.of(context).size.width - 32.0,
                          iconPath: 'assets/icons/icon_download.png',
                          onPressed: () {
                            final movieState = movieDetailsProvider.downloadMovie();
                            if (movieState == null) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackbarHelper.buildInfoSnackbar(
                                  context: context,
                                  text: 'snackbar_download_new'.tr(namedArgs: {'movie': movieDetailsProvider.movie.title}),
                                ),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackbarHelper.buildInfoSnackbar(
                                  context: context,
                                  text: 'snackbar_download_exist'.tr(namedArgs: {'movie': movieDetailsProvider.movie.title}),
                                ),
                              );
                            }
                          },
                        ),
                        const SizedBox(height: 20),
                        Text(
                          '${movieDetailsProvider.movie.details} : ${movieDetailsProvider.movie.title}',
                          style: CustomTextStyles.of(context).semiBold16,
                        ),
                        const SizedBox(height: 12),
                        Text(
                          movieDetailsProvider.movie.subtitle,
                          style: CustomTextStyles.of(context).regular12,
                        ),
                        const SizedBox(height: 12),
                        Text.rich(
                          TextSpan(
                            text: '${'detail_genres'.tr()}: ',
                            style: CustomTextStyles.of(context).regular12.apply(color: CustomColors.of(context).inactive),
                            children: [
                              TextSpan(
                                text: movieDetailsProvider.movie.genres.map((e) => e.toLocalisedString()).join(', '),
                                style: CustomTextStyles.of(context).regular12,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Expanded(
                              child: Align(
                                alignment: Alignment.center,
                                child: movieDetailsProvider.isMovieInMyList()
                                    ? CustomSecondaryButton(
                                        title: 'detail_my_list'.tr(),
                                        iconPath: 'assets/icons/icon_checkmark.png',
                                        padding: 12,
                                        onPressed: () {
                                          movieDetailsProvider.removeMovieFromMyList();
                                        },
                                      )
                                    : CustomSecondaryButton(
                                        title: 'detail_my_list'.tr(),
                                        iconPath: 'assets/icons/icon_plus_circle.png',
                                        padding: 12,
                                        onPressed: () {
                                          movieDetailsProvider.addMovieToMyList();
                                        },
                                      ),
                              ),
                            ),
                            CustomSecondaryButton(
                              title: 'detail_rated'.tr(),
                              iconPath: 'assets/icons/icon_rated_filled.png',
                              padding: 12,
                            ),
                            Expanded(
                              child: Align(
                                alignment: Alignment.center,
                                child: CustomSecondaryButton(
                                  title: 'detail_share'.tr(),
                                  iconPath: 'assets/icons/icon_share.png',
                                  padding: 12,
                                ),
                              ),
                            ),
                          ],
                        ),
                        tabBarDetails(context, movieDetailsProvider.movie),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
