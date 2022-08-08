import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:movie_wtc/extensions/custom_colors.dart';
import 'package:movie_wtc/extensions/custom_text_styles.dart';
import 'package:movie_wtc/models/movie.dart';
import 'package:movie_wtc/pages/tab_container.dart';
import 'package:movie_wtc/providers/detail_provider.dart';
import 'package:movie_wtc/widgets/custom_app_bar.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_wtc/widgets/custom_button_with_icon.dart';
import 'package:movie_wtc/widgets/custom_secondary_button.dart';
import 'package:movie_wtc/widgets/tab_bar_detail.dart';
import 'package:provider/provider.dart';

class DetailPage extends StatelessWidget {
  static const pageName = 'detail-page';
  final Movie movie;

  const DetailPage({super.key, required this.movie});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.of(context).secondaryBackground,
      extendBodyBehindAppBar: false,
      appBar: CustomAppBar(
        leftIcon: LeftIcon.backArrow,
        rightIcon: RightIcon.search,
        backButton: () {
          context.goNamed(TabContainer.pageName);
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
                height: 185,
                width: MediaQuery.of(context).size.width,
                child: Image.asset(movie.coverImage, fit: BoxFit.cover)),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, top: 24, right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.title,
                    style: CustomTextStyles.of(context).semiBold24,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    '${movie.year.toString()}  •  ${movie.rated.toString()}+',
                    style: CustomTextStyles.of(context)
                        .regular12
                        .apply(color: CustomColors.of(context).inactive),
                  ),
                  const SizedBox(height: 20),
                  CustomButtonWithIcon(
                    title: 'home_play'.tr(),
                    width: 363,
                    iconPath: 'assets/icons/icon_play_filled.png',
                    onPressed: () {},
                    isBlack: false,
                  ),
                  const SizedBox(height: 12),
                  CustomButtonWithIcon(
                    title: '${'detail_download'.tr()} ${movie.title}',
                    width: 363,
                    iconPath: 'assets/icons/icon_download.png',
                    onPressed: () {},
                    isBlack: true,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    '${movie.details} : ${movie.title}',
                    style: CustomTextStyles.of(context).semiBold16,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    movie.subtitle,
                    style: CustomTextStyles.of(context).regular12,
                  ),
                  const SizedBox(height: 12),
                  Text.rich(
                    TextSpan(
                      text: '${'detail_genres'.tr()}: ',
                      style: CustomTextStyles.of(context)
                          .regular12
                          .apply(color: CustomColors.of(context).inactive),
                      children: [
                        TextSpan(
                          text: movie.genres
                              .map((e) => e.toLocalisedString())
                              .join(', '),
                          style: CustomTextStyles.of(context).regular12,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 26),
                  ChangeNotifierProvider(
                      create: (context) => DetailProvider(),
                      child: Consumer<DetailProvider>(
                        builder: (context, detailProvider, child) {
                          return Row(
                            children: [
                              Expanded(
                                child: Align(
                                  alignment: Alignment.center,
                                  child: CustomSecondaryButton(
                                    title: 'detail_my_list'.tr(),
                                    iconPath: detailProvider
                                            .isMovieInMyList(movie)
                                        ? 'assets/icons/icon_checkmark.png'
                                        : 'assets/icons/icon_plus_circle.png',
                                    onPressed: () =>
                                        detailProvider.isMovieInMyList(movie)
                                            ? detailProvider
                                                .removeMovieFromMyList(movie)
                                            : detailProvider
                                                .addMovieInMyList(movie),
                                  ),
                                ),
                              ),
                              CustomSecondaryButton(
                                title: 'detail_rated'.tr(),
                                iconPath: 'assets/icons/icon_rated.png',
                              ),
                              Expanded(
                                child: Align(
                                  alignment: Alignment.center,
                                  child: CustomSecondaryButton(
                                    title: 'detail_share'.tr(),
                                    iconPath: 'assets/icons/icon_share.png',
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
