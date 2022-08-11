import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_wtc/extensions/custom_colors.dart';
import 'package:movie_wtc/extensions/custom_text_styles.dart';
import 'package:movie_wtc/models/movie.dart';
import 'package:movie_wtc/providers/search_provider.dart';
import 'package:movie_wtc/widgets/custom_app_bar.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatelessWidget {
  static const pageName = 'search';
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.of(context).background,
      appBar: const CustomAppBar(hasBackButton: true),
      body: ChangeNotifierProvider(
        create: ((context) => SearchProvider()),
        child: Consumer<SearchProvider>(
          builder: (context, searchProvider, child) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  searchFormField(context, searchProvider),
                  const SizedBox(height: 16),
                  Text(
                    searchProvider.controller.text == ''
                        ? 'search_top_searches'.tr()
                        : 'search_movies_and_shows'.tr(),
                    style: CustomTextStyles.of(context).semiBold18,
                  ),
                  const SizedBox(height: 16),
                  searchProvider.controller.text == ''
                      ? topSearch(context, searchProvider)
                      : moviesAndTVshows(context, searchProvider),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

Widget searchFormField(BuildContext context, SearchProvider searchProvider) {
  return TextFormField(
    style: const TextStyle(color: Color(0xffEAEAEB)),
    cursorHeight: 20,
    cursorColor: Color(0xffEAEAEB),
    decoration: InputDecoration(
      filled: true,
      fillColor: CustomColors.of(context).searchBackground,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: CustomColors.of(context).searchBackground,
          width: 0,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: CustomColors.of(context).searchBackground,
          width: 0,
        ),
      ),
      contentPadding: EdgeInsets.zero,
      suffixIcon: SizedBox(
        height: 16,
        width: 16,
        child: GestureDetector(
          onTap: () {
            showModalBottomSheet(
                context: context,
                backgroundColor: CustomColors.of(context).background,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                builder: (context) {
                  return bottomSheetSearch(context);
                });
          },
          child: Image.asset('assets/icons/icon_slider.png'),
        ),
      ),
      prefixIcon: Padding(
        padding: const EdgeInsets.only(left: 8, right: 6),
        child: SizedBox(
          height: 16,
          width: 16,
          child: Image.asset('assets/icons/icon_search_grey.png'),
        ),
      ),
      prefixIconColor: CustomColors.of(context).searchField,
      hintText: 'search_hint_text'.tr(),
      hintStyle: CustomTextStyles.of(context)
          .regular17
          .apply(color: CustomColors.of(context).searchField.withOpacity(0.6)),
      prefixIconConstraints: const BoxConstraints(
        maxWidth: 35,
      ),
    ),
    controller: searchProvider.controller,
    onChanged: (str) {
      searchProvider.search();
    },
  );
}

Widget topSearch(BuildContext context, SearchProvider searchProvider) {
  return Expanded(
    child: ListView.builder(
      itemCount: 4,
      itemBuilder: (context, index) => getSearchCell(
        context,
        searchProvider.suggestedMovies[index],
      ),
    ),
  );
}

Widget getSearchCell(BuildContext context, Movie movie) {
  return Container(
    height: 60,
    margin: const EdgeInsets.symmetric(vertical: 8),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: SizedBox(
            width: 100,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: Image.asset(
                movie.coverImage,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                movie.title,
                style: CustomTextStyles.of(context).medium12,
              ),
              const SizedBox(height: 6),
              Text(
                movie.genres.map((e) => e.toLocalisedString()).join(', '),
                style: CustomTextStyles.of(context)
                    .regular10
                    .apply(color: CustomColors.of(context).inactive),
              ),
              const SizedBox(height: 8),
              Text(
                '${movie.releaseDate.year} | ${movie.rated}+ | ${movie.length.toStringAsFixed(0)}min',
                style: CustomTextStyles.of(context)
                    .regular10
                    .apply(color: CustomColors.of(context).inactive),
              ),
            ],
          ),
        ),
        Image.asset('assets/icons/icon_arrow_right.png'),
      ],
    ),
  );
}

Widget moviesAndTVshows(BuildContext context, SearchProvider searchProvider) {
  return Expanded(
    child: Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        itemCount: searchProvider.searchMovie.length,
        itemBuilder: (context, index) {
          print(searchProvider.searchMovie);
          return SizedBox(
            height: 138,
            width: 108,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                searchProvider.searchMovie.elementAt(index).coverImage,
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    ),
  );
}

Widget bottomSheetSearch(BuildContext context) {
  return BackdropFilter(
    filter: ImageFilter.blur(sigmaX: 1.9, tileMode: TileMode.decal),
    child: SizedBox(
      height: 363,
      child: SizedBox(
        height: 363,
        child: Column(
          children: [
            Container(
              height: 60,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(
                  'search_filters'.tr(),
                  style: CustomTextStyles.of(context).semiBold18,
                ),
                trailing: IconButton(
                  onPressed: () {
                    context.pop();
                  },
                  icon: Image.asset('assets/icons/icon_close.png'),
                ),
              ),
            ),
            Divider(
              height: 1,
              color: CustomColors.of(context).searchBackground,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
              child: DecoratedBox(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: CustomColors.of(context).searchBackground),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 14),
                      child: SizedBox(
                        height: 44,
                        child: Text(
                          'Category'.toUpperCase(),
                          style: CustomTextStyles.of(context).semiBold16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
