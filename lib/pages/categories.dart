import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_wtc/extensions/custom_colors.dart';
import 'package:movie_wtc/extensions/custom_text_styles.dart';
import 'package:movie_wtc/helpers/capitalized_helper.dart';
import 'package:movie_wtc/pages/category_details.dart';
import 'package:movie_wtc/pages/movie_details.dart';
import 'package:movie_wtc/providers/categories_provider.dart';
import 'package:movie_wtc/widgets/custom_app_bar.dart';
import 'package:provider/provider.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({Key? key}) : super(key: key);
  static const pageName = 'categories';
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CategoriesProvider(),
      child: Consumer<CategoriesProvider>(
        builder: ((context, categoriesProvider, child) {
          var mapKeys = categoriesProvider.mapOfCategories.keys;
          return Scaffold(
            backgroundColor: CustomColors.of(context).background,
            appBar: const CustomAppBar(
              hasBackButton: true,
              hasSearchButton: true,
            ),
            body: ListView.builder(
              itemCount: mapKeys.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                var keyGenre = mapKeys.elementAt(index);
                var mapValues = categoriesProvider.mapOfCategories[keyGenre]!;
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            CapitalizedString.capitalized(keyGenre),
                            style: CustomTextStyles.of(context)
                                .semiBold18
                                .apply(
                                    color:
                                        CustomColors.of(context).primaryText),
                          ),
                          GestureDetector(
                            onTap: () {
                              context.pushNamed(CategoryDetailsPage.pageName,
                                  params: {'categoryName': keyGenre});
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(right: 12),
                              child: Text('categories_see_more'.tr(),
                                  style: CustomTextStyles.of(context)
                                      .regular12
                                      .apply(
                                          color: CustomColors.of(context)
                                              .primary)),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        height: 262,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: mapValues.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            var movie = mapValues[index];

                            return Container(
                              margin: const EdgeInsets.only(right: 10),
                              width: 134,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 134,
                                    height: 179,
                                    child: GestureDetector(
                                      onTap: () {
                                        context.pushNamed(MovieDetails.pageName,
                                            params: {'id': movie.id});
                                      },
                                      child: ClipRRect(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(8.0)),
                                        child: Image.asset(
                                          movie.coverImage,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    movie.title,
                                    style:
                                        CustomTextStyles.of(context).semiBold14,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    softWrap: true,
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    movie.genres
                                        .map((e) => e.toLocalisedString())
                                        .join(', '),
                                    style: CustomTextStyles.of(context)
                                        .regular12
                                        .apply(
                                          color:
                                              CustomColors.of(context).inactive,
                                        ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    softWrap: true,
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        }),
      ),
    );
  }
}
