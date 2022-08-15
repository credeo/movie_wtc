import 'package:flutter/material.dart';
import 'package:movie_wtc/extensions/custom_colors.dart';
import 'package:movie_wtc/extensions/custom_text_styles.dart';
import 'package:movie_wtc/models/movie.dart';
import 'package:movie_wtc/providers/categories_provider.dart';
import 'package:movie_wtc/widgets/custom_app_bar.dart';
import 'package:provider/provider.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({Key? key}) : super(key: key);
  static const pageName = 'categories';
  @override
  Widget build(BuildContext context) {
    final Genre genre;
    return Scaffold(
      backgroundColor: CustomColors.of(context).background,
      body: ChangeNotifierProvider(
        create: (context) => CategoriesProvider(),
        child: Consumer<CategoriesProvider>(
          builder: ((context, categoriesProvider, child) {
            List<String> genre = Genre.values.map((e) => e.name).toList();
            return ListView.builder(
              itemCount: genre.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            (genre[index]),
                            style: CustomTextStyles.of(context)
                                .semiBold18
                                .apply(
                                    color:
                                        CustomColors.of(context).primaryText),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 12),
                            child: Text(
                              'See More',
                              style: CustomTextStyles.of(context)
                                  .regular12
                                  .apply(
                                      color: CustomColors.of(context).primary),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        height: 262,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: categoriesProvider.movie.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: const EdgeInsets.only(right: 10),
                              width: 134,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 134,
                                    height: 179,
                                    child: ClipRRect(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(8.0)),
                                      child: Image.asset(
                                        categoriesProvider
                                            .movie[index].coverImage,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    categoriesProvider.movie[index].title,
                                    style:
                                        CustomTextStyles.of(context).semiBold14,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    softWrap: true,
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    categoriesProvider.movie[index].genres
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
            );
          }),
        ),
      ),
    );
  }
}
