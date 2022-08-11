import 'package:flutter/material.dart';
import 'package:movie_wtc/extensions/custom_colors.dart';
import 'package:movie_wtc/extensions/custom_text_styles.dart';
import 'package:movie_wtc/models/movie.dart';
import 'package:movie_wtc/widgets/custom_app_bar.dart';

class CategoriesPage extends StatelessWidget {
  static const pageName = 'categories';

  const CategoriesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        hasBackButton: true,
        hasSearchButton: true,
      ),
      body: ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: 5,
          itemBuilder: (context, index) {
            return getCategorySection(
                context: context, categoryTitle: 'Romance');
          }),
    );
  }

  Widget getCategorySection(
      {required BuildContext context, required String categoryTitle}) {
    return Container(
      height: 310,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 20.0,
              left: 20,
              right: 20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  categoryTitle,
                  style: CustomTextStyles.of(context).semiBold18,
                ),
                Text(
                  'See More',
                  style: CustomTextStyles.of(context).regular12.apply(
                        color: CustomColors.of(context).primary,
                      ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              height: 220,
              padding: const EdgeInsets.only(top: 20.0, left: 12),
              child: ListView.builder(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.horizontal,
                itemCount: 20,
                itemBuilder: (context, index) {
                  return getOneItem(context: context, movie: Movie.test(0));
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget getOneItem({required BuildContext context, required Movie movie}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        ClipRRect(
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
        SizedBox(height: 8),
        Text(
          movie.title,
          style: CustomTextStyles.of(context).semiBold14,
        ),
        SizedBox(height: 8),
        Text(
          movie.details,
          style: CustomTextStyles.of(context).regular12.apply(
                color: CustomColors.of(context).inactive,
              ),
        ),
      ]),
    );
  }
}
