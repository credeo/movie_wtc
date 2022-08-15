import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_wtc/extensions/custom_colors.dart';
import 'package:movie_wtc/extensions/custom_text_styles.dart';
import 'package:movie_wtc/helpers/capitalized_helper.dart';
import 'package:movie_wtc/models/movie.dart';
import 'package:movie_wtc/pages/movie_details.dart';
import 'package:movie_wtc/providers/categories_provider.dart';
import 'package:movie_wtc/widgets/custom_app_bar.dart';
import 'package:provider/provider.dart';

class CategoryDetailsPage extends StatelessWidget {
  final String categoryName;
  const CategoryDetailsPage({Key? key, required this.categoryName})
      : super(key: key);

  static const pageName = 'category_details';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CategoriesProvider(),
      child: Consumer<CategoriesProvider>(
        builder: ((context, categoriesProvider, child) {
          return Scaffold(
              backgroundColor: CustomColors.of(context).background,
              appBar: const CustomAppBar(
                hasBackButton: true,
                hasSearchButton: true,
              ),
              body: categoriesProvider.mapOfCategories.keys
                      .contains(categoryName)
                  ? ListView(
                      padding: EdgeInsets.zero,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Text(
                            CapitalizedString.capitalized(categoryName),
                            style: CustomTextStyles.of(context)
                                .semiBold24
                                .apply(
                                    color:
                                        CustomColors.of(context).primaryText),
                          ),
                        ),
                        categorySection(
                            context: context,
                            categoryName: categoryName,
                            sectionTitle: 'category_details_trending_now'.tr(),
                            categoriesProvider: categoriesProvider),
                        categorySection(
                            context: context,
                            categoryName: categoryName,
                            sectionTitle: 'category_details_most_recent'.tr(),
                            categoriesProvider: categoriesProvider),
                        categorySection(
                          context: context,
                          categoryName: categoryName,
                          sectionTitle: 'category_details_most_viewed'.tr(),
                          categoriesProvider: categoriesProvider,
                        ),
                      ],
                    )
                  : Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            CapitalizedString.capitalized(categoryName),
                            style: CustomTextStyles.of(context)
                                .semiBold24
                                .apply(
                                    color:
                                        CustomColors.of(context).primaryText),
                          ),
                          const SizedBox(height: 20),
                          Center(
                            child: Text(
                              'category_details_no_movie'.tr(),
                              style: CustomTextStyles.of(context)
                                  .regular12
                                  .apply(
                                      color: CustomColors.of(context).inactive),
                            ),
                          ),
                        ],
                      ),
                    ));
        }),
      ),
    );
  }
}

Widget categorySection({
  required BuildContext context,
  required String sectionTitle,
  required String categoryName,
  required CategoriesProvider categoriesProvider,
}) {
  return Padding(
    padding: const EdgeInsets.only(left: 20, top: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          sectionTitle,
          style: CustomTextStyles.of(context).semiBold18,
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: 226,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categoriesProvider.mapOfCategories[categoryName]!.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              List<Movie> values =
                  categoriesProvider.mapOfCategories[categoryName]!;
              Movie movie = values.elementAt(index);

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
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8.0)),
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
                      style: CustomTextStyles.of(context).semiBold14,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                    ),
                    const SizedBox(height: 6),
                    Text(
                      movie.genres.map((e) => e.toLocalisedString()).join(', '),
                      style: CustomTextStyles.of(context).regular12.apply(
                            color: CustomColors.of(context).inactive,
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
}
