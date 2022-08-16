import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_wtc/extensions/custom_colors.dart';
import 'package:movie_wtc/extensions/custom_text_styles.dart';
import 'package:movie_wtc/models/movie.dart';
import 'package:movie_wtc/pages/category_details.dart';
import 'package:movie_wtc/pages/movie_details.dart';
import 'package:movie_wtc/providers/categories_provider.dart';
import 'package:movie_wtc/widgets/custom_app_bar.dart';
import 'package:provider/provider.dart';

class CategoriesPage extends StatelessWidget {
  static const pageName = 'categories';

  const CategoriesPage({Key? key}) : super(key: key);

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
            body: ListView.builder(
                padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
                itemCount: categoriesProvider.map.keys.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: index + 1 < categoriesProvider.map.keys.length ? 40.0 : 0.0),
                    child: getCategorySection(
                        context: context,
                        categoryTitle: categoriesProvider.map.keys.elementAt(index),
                        categoriesProvider: categoriesProvider),
                  );
                }),
          );
        },
      ),
    );
  }

  Widget getCategorySection({
    required BuildContext context,
    required String categoryTitle,
    required CategoriesProvider categoriesProvider,
  }) {
    return SizedBox(
      height: 280,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${categoryTitle[0].toUpperCase()}${categoryTitle.substring(1)}',
                  style: CustomTextStyles.of(context).semiBold18,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                SizedBox(
                  height: 28,
                  child: CupertinoButton(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                    onPressed: () {
                      context.goNamed(CategoryDetailsPage.pageName, params: {'name': categoryTitle});
                    },
                    child: Text(
                      'category_see_more'.tr(),
                      style: CustomTextStyles.of(context).regular12.apply(color: CustomColors.of(context).primary),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              height: 220,
              margin: const EdgeInsets.only(top: 12.0),
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return getOneItem(
                    context: context,
                    movie: categoriesProvider.map[categoryTitle]!.elementAt(index),
                  );
                },
                itemCount: categoriesProvider.map[categoryTitle]!.length,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget getOneItem({required BuildContext context, required Movie movie}) {
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
                  height: 170,
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
                style: CustomTextStyles.of(context).regular12.apply(
                      color: CustomColors.of(context).inactive,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
