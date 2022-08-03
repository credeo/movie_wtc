import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_wtc/extensions/custom_colors.dart';
import 'package:movie_wtc/extensions/custom_text_styles.dart';
import 'package:movie_wtc/models/movie.dart';
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
                  const SafeArea(child: CustomAppBar()),
                  Expanded(
                    child: renderPage(
                        context: context,
                        comingSoonProvider: comingSoonProvider),
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

  Widget renderPage(
      {required BuildContext context,
      required ComingSoonProvider comingSoonProvider}) {
    return ListView.builder(
      itemCount: 1 + comingSoonProvider.comingSoonMovies.length,
      itemBuilder: (context, index) {
        final Widget widget;
        if (index == 0) {
          widget = Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              'coming_soon_title'.tr(),
              style: CustomTextStyles.of(context).semiBold18,
            ),
          );
        } else {
          final movie = comingSoonProvider.comingSoonMovies[index - 1];
          widget = buildComingSoonCell(context: context, movie: movie);
        }
        return widget;
      },
    );
  }

  Widget buildComingSoonCell(
      {required BuildContext context, required Movie movie}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                formatDateToShortMonth(movie.releaseDate).toUpperCase(),
                style: CustomTextStyles.of(context).semiBold14.apply(
                    color:
                        CustomColors.of(context).primaryText.withOpacity(0.6)),
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
                        child: Image.asset(
                          movie.coverImage,
                          fit: BoxFit.cover,
                        ),
                      ),
                      movie.ageRating != null
                          ? Positioned(
                              height: 28,
                              width: 28,
                              right: 8,
                              top: 8,
                              child: ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(5.0)),
                                  child: Image.asset(
                                    'assets/icons/icon_restricted.png',
                                    fit: BoxFit.contain,
                                  )),
                            )
                          : Positioned.fill(
                              child: Image.asset(
                                movie.coverImage,
                                fit: BoxFit.cover,
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
                        text: movie.genres
                            .map((e) => e.toLocalisedString())
                            .join(', '),
                        style: CustomTextStyles.of(context).regular12,
                      ),
                    ],
                  ),
                  style: CustomTextStyles.of(context)
                      .regular12
                      .apply(color: CustomColors.of(context).inactive),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: CustomSecondaryButton(
                          title: 'coming_soon_more_info'.tr(),
                          iconPath: 'assets/icons/icon_info.png',
                        ),
                      ),
                    ),
                    CustomSecondaryButton(
                      title: 'coming_soon_remind_me'.tr(),
                      iconPath: 'assets/icons/icon_notification_outlined.png',
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: CustomSecondaryButton(
                          title: 'coming_soon_my_list'.tr(),
                          iconPath: 'assets/icons/icon_plus_circle.png',
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
