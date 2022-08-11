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
          itemCount: 5,
          itemBuilder: (context, index) {
            return getCategorySection(
                context: context, categoryTitle: 'Romance');
          }),
    );
  }

  Widget getCategorySection(
      {required BuildContext context, required String categoryTitle}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 400,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
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
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: ListView.builder(
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.horizontal,
                    itemCount: 20,
                    itemBuilder: (context, index) {
                      return myListWidget(
                          context: context,
                          movie: Movie.test(0),
                          callback: () {});
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget myListWidget({
    required BuildContext context,
    required Movie movie,
    required VoidCallback callback,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      height: 220,
      width: 134,
      color: Colors.red,
      child: Column(
        children: [
          SizedBox(
            height: 179,
            width: 134,
            child: Image.asset(
              movie.coverImage,
              fit: BoxFit.contain,
            ),
          ),
          Text(movie.title),
          Text(movie.details),
        ],
      ),
    );
  }
}
