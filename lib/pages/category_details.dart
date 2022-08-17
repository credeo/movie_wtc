import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_wtc/extensions/custom_colors.dart';
import 'package:movie_wtc/extensions/custom_text_styles.dart';

import 'package:movie_wtc/models/movie.dart';
import 'package:movie_wtc/providers/categories_provider.dart';
import 'package:movie_wtc/widgets/custom_app_bar.dart';
import 'package:provider/provider.dart';

import 'package:movie_wtc/pages/movie_details.dart';

class CategoryDetailsPage extends StatelessWidget {
  const CategoryDetailsPage({Key? key, required this.categoryName})
      : super(key: key);
  static const pageName = 'category-details';

  final String categoryName;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CategoriesProvider>(
      create: (context) => CategoriesProvider(),
      child: Consumer<CategoriesProvider>(
        builder: (context, categoriesProvider, child) {
          return Scaffold(
              backgroundColor: CustomColors.of(context).background,
              appBar: const CustomAppBar(
                hasBackButton: true,
                hasSearchButton: true,
              ),
              body: categoriesProvider.map.keys.contains(categoryName)
                  ? ListView(
                      padding: EdgeInsets.zero,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Text(
                            '${categoryName[0].toUpperCase()}${categoryName.substring(1)}',
                            style: CustomTextStyles.of(context).semiBold24,
                          ),
                        ),
                        getSection(
                            context: context,
                            sectionTitle: 'category_details_trending_now'.tr(),
                            categoriesProvider: categoriesProvider),
                        getSection(
                            context: context,
                            sectionTitle: 'category_details_most_recent'.tr(),
                            categoriesProvider: categoriesProvider),
                        getSection(
                          context: context,
                          sectionTitle: 'category_details_most_viewed'.tr(),
                          categoriesProvider: categoriesProvider,
                        ),
                      ],
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Text(
                              '${categoryName[0].toUpperCase()}${categoryName.substring(1)}',
                              style: CustomTextStyles.of(context).semiBold24,
                            ),
                          ),
                        ),
                        Text(
                          'category_details_no_movie'.tr(),
                          style: CustomTextStyles.of(context).regular24,
                        ),
                        const Text(''),
                      ],
                    ));
        },
      ),
    );
  }

  Widget getSection({
    required BuildContext context,
    required String sectionTitle,
    required CategoriesProvider categoriesProvider,
  }) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20.0, left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                sectionTitle,
                style: CustomTextStyles.of(context).semiBold18,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ],
          ),
        ),
        Container(
          height: 220,
          margin: const EdgeInsets.only(top: 20.0, left: 12),
          child: ListView.builder(
            padding: EdgeInsets.zero,
            scrollDirection: Axis.horizontal,
            itemCount: categoriesProvider.map[categoryName]!.length,
            itemBuilder: (context, index) {
              return getCategoryCell(
                context: context,
                movie: categoriesProvider.map[categoryName]!.elementAt(index),
              );
            },
          ),
        )
      ],
    );
  }

  Widget getCategoryCell(
      {required BuildContext context, required Movie movie}) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        context.pushNamed(MovieDetails.pageName, params: {'id': movie.id});
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: SizedBox(
                  width: 134,
                  child: Image.asset(
                    movie.coverImage,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: 134,
              child: Text(
                movie.title,
                style: CustomTextStyles.of(context).semiBold14,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: 134,
              child: Text(
                movie.details,
                style: CustomTextStyles.of(context)
                    .regular12
                    .apply(color: CustomColors.of(context).inactive),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
