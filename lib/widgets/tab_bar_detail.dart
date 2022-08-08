import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:movie_wtc/extensions/custom_colors.dart';
import 'package:movie_wtc/extensions/custom_text_styles.dart';
import 'package:movie_wtc/models/movie.dart';

Widget tabBarDetails(BuildContext context, Movie movie) {
  return DefaultTabController(
    length: 4,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PreferredSize(
          preferredSize: const Size(50, 50),
          child: TabBar(
            indicator: UnderlineTabIndicator(
              insets: const EdgeInsets.only(left: 1, right: 25),
              borderSide: BorderSide(
                color: CustomColors.of(context).primary,
                width: 2.0,
              ),
            ),
            indicatorSize: TabBarIndicatorSize.label,
            isScrollable: true,
            labelPadding: const EdgeInsets.fromLTRB(0.0, 0.0, 24.0, 0.0),
            padding: const EdgeInsets.only(bottom: 16),
            tabs: [
              Tab(
                child: Text('detail_episodes'.tr(),
                    style: CustomTextStyles.of(context).medium14),
              ),
              Tab(
                child: Text('detail_trailers'.tr(),
                    style: CustomTextStyles.of(context).medium14),
              ),
              Tab(
                child: Text('detail_cast'.tr(),
                    style: CustomTextStyles.of(context).medium14),
              ),
              Tab(
                child: Text('detail_more'.tr(),
                    style: CustomTextStyles.of(context).medium14),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 300,
          child: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 60,
                      width: 100,
                      child: Image.asset(
                        movie.coverImage,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${movie.details} : ${movie.title} ',
                          style: CustomTextStyles.of(context).medium12.apply(
                              color: CustomColors.of(context).primaryText),
                        ),
                        Text(
                          '${movie.length.toStringAsFixed(0)}min',
                          style: CustomTextStyles.of(context)
                              .medium12
                              .apply(color: CustomColors.of(context).inactive),
                        ),
                      ],
                    ),
                  ],
                ),
                Container(color: Colors.black),
                Container(color: Colors.black),
                Container(color: Colors.black),
              ]),
        )
      ],
    ),
  );
}
