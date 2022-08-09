import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:movie_wtc/extensions/custom_colors.dart';
import 'package:movie_wtc/extensions/custom_text_styles.dart';
import 'package:movie_wtc/models/movie.dart';
import 'package:movie_wtc/providers/downloads_provider.dart';
import 'package:movie_wtc/widgets/custom_app_bar.dart';
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
      appBar: const CustomAppBar(),
      body: ChangeNotifierProvider(
          create: (context) => DownloadsProvider(),
          child: Consumer<DownloadsProvider>(
            builder: (context, downloadProvider, child) {
              return SingleChildScrollView(
                scrollDirection: Axis.vertical,
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
                            '${movie.releaseDate.year.toString()}  •  ${movie.rated.toString()}+',
                            style: CustomTextStyles.of(context).regular12.apply(color: CustomColors.of(context).inactive),
                          ),
                          const SizedBox(height: 20),
                          CustomButtonWithIcon(
                            title: 'home_play'.tr(),
                            width: 363,
                            iconPath: 'assets/icons/icon_play_filled.png',
                            onPressed: () {},
                          ),
                          const SizedBox(height: 12),
                          CustomButtonWithIcon.secondary(
                            title: '${'detail_download'.tr()} ${movie.title}',
                            width: 363,
                            iconPath: 'assets/icons/icon_download.png',
                            onPressed: () {},
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
                              style: CustomTextStyles.of(context).regular12.apply(color: CustomColors.of(context).inactive),
                              children: [
                                TextSpan(
                                  text: movie.genres.map((e) => e.toLocalisedString()).join(', '),
                                  style: CustomTextStyles.of(context).regular12,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 26),
                          Row(
                            children: [
                              Expanded(
                                child: Align(
                                  alignment: Alignment.center,
                                  child: CustomSecondaryButton(
                                    title: 'detail_my_list'.tr(),
                                    iconPath: 'assets/icons/icon_checkmark.png',
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
                          ),
                          tabBarDetails(context, movie),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          )),
    );
  }
}
