import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_wtc/extensions/custom_colors.dart';
import 'package:movie_wtc/extensions/custom_text_styles.dart';
import 'package:movie_wtc/models/movie.dart';
import 'package:movie_wtc/pages/movie_details.dart';
import 'package:movie_wtc/providers/coming_soon_provider.dart';
import 'package:movie_wtc/widgets/custom_app_bar.dart';
import 'package:movie_wtc/widgets/custom_secondary_button.dart';
import 'package:provider/provider.dart';

class ComingSoon extends StatelessWidget {
  const ComingSoon({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ComingSoonProvider(),
      child: Consumer<ComingSoonProvider>(
        builder: (context, comingSoonProvider, child) {
          final Widget widget;
          switch (comingSoonProvider.state) {
            case HomeState.loading:
              widget = Center(
                child: CircularProgressIndicator(
                  color: CustomColors.of(context).primary,
                ),
              );
              break;
            case HomeState.ready:
              widget = Column(
                children: [
                  const SafeArea(
                      child: CustomAppBar(
                    hasNotificationButton: true,
                  )),
                  Expanded(
                    child: renderPage(context: context, comingSoonProvider: comingSoonProvider),
                  ),
                ],
              );
              break;
          }
          return widget;
        },
      ),
    );
  }

  Widget renderPage({required BuildContext context, required ComingSoonProvider comingSoonProvider}) {
    return ListView.builder(
      itemCount: 1 + comingSoonProvider.comingSoonMovies.length,
      padding: const EdgeInsets.only(top: 8),
      itemBuilder: (context, index) {
        final Widget widget;
        if (index == 0) {
          widget = Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
            child: Text(
              'coming_soon_title'.tr(),
              style: CustomTextStyles.of(context).semiBold18,
            ),
          );
        } else {
          final movie = comingSoonProvider.comingSoonMovies[index - 1];
          widget = buildComingSoonCell(context: context, movie: movie, comingSoonProvider: comingSoonProvider);
        }
        return widget;
      },
    );
  }

  Widget buildComingSoonCell({
    required BuildContext context,
    required Movie movie,
    required ComingSoonProvider comingSoonProvider,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                formatDateToShortMonth(movie.releaseDate).toUpperCase(),
                style:
                    CustomTextStyles.of(context).semiBold14.apply(color: CustomColors.of(context).primaryText.withOpacity(0.6)),
              ),
              Text(
                movie.releaseDate.day.toString(),
                style: CustomTextStyles.of(context).semiBold28,
              ),
            ],
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 160,
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            movie.coverImage,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      if (movie.rated >= 18)
                        Positioned(
                          top: 8,
                          right: 8,
                          child: Container(
                            decoration: BoxDecoration(
                              color: CustomColors.of(context).background,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(8.0),
                              ),
                            ),
                            width: 28,
                            height: 28,
                            child: Center(
                              child: Text(
                                '18+',
                                style: CustomTextStyles.of(context).regular12,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  movie.title,
                  style: CustomTextStyles.of(context).semiBold24,
                ),
                const SizedBox(height: 12),
                Text(
                  movie.subtitle,
                  style: CustomTextStyles.of(context).regular12,
                ),
                const SizedBox(height: 12),
                Text.rich(
                  TextSpan(
                    text: '${'coming_soon_genres'.tr()}: ',
                    children: [
                      TextSpan(
                        text: movie.genres.map((e) => e.toLocalisedString()).join(', '),
                        style: CustomTextStyles.of(context).regular12,
                      ),
                    ],
                  ),
                  style: CustomTextStyles.of(context).regular12.apply(color: CustomColors.of(context).inactive),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: CustomSecondaryButton(
                          title: 'coming_soon_info'.tr(),
                          iconPath: 'assets/icons/icon_info.png',
                          onPressed: () {
                            context.goNamed(MovieDetails.pageName, params: {'id': movie.id});
                          },
                        ),
                      ),
                    ),
                    CustomSecondaryButton(
                      title: 'coming_soon_remind'.tr(),
                      onPressed: () {
                        comingSoonProvider.toggleNotificationForMovie(movie);
                      },
                      iconPath: comingSoonProvider.isMovieInNotificationsList(movie)
                          ? 'assets/icons/icon_notification_filled.png'
                          : 'assets/icons/icon_notification.png',
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: comingSoonProvider.isMovieInMyList(movie)
                            ? CustomSecondaryButton(
                                iconPath: 'assets/icons/icon_checkmark.png',
                                title: 'coming_soon_my_list_button'.tr(),
                                onPressed: () {
                                  comingSoonProvider.removeMovieFromMyList(movie);
                                },
                              )
                            : CustomSecondaryButton(
                                iconPath: 'assets/icons/icon_plus_circle.png',
                                title: 'coming_soon_my_list_button'.tr(),
                                onPressed: () {
                                  comingSoonProvider.addMovieToMyList(movie);
                                },
                              ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String formatDateToShortMonth(DateTime date) {
    final f = DateFormat('MMM');
    return f.format(date);
  }
}
