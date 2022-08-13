import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_wtc/extensions/custom_colors.dart';
import 'package:movie_wtc/extensions/custom_text_styles.dart';
import 'package:movie_wtc/models/movie.dart';
import 'package:movie_wtc/pages/movie_details.dart';
import 'package:movie_wtc/providers/search_provider.dart';
import 'package:movie_wtc/widgets/custom_app_bar.dart';
import 'package:movie_wtc/widgets/movie_search_bottom_sheet.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatelessWidget {
  static const pageName = 'search';

  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        hasBackButton: true,
      ),
      backgroundColor: CustomColors.of(context).background,
      body: ChangeNotifierProvider(
        create: (context) => SearchProvider(),
        child: Consumer<SearchProvider>(
          builder: (context, searchProvider, child) {
            return Container(
              padding: const EdgeInsets.only(left: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  getTextField(context, searchProvider),
                  Padding(
                    padding: const EdgeInsets.only(top: 16, bottom: 12),
                    child: Text(
                      searchProvider.isSearchActive
                          ? 'search_movies_and_shows'.tr()
                          : 'search_top_searches'.tr(),
                      style: CustomTextStyles.of(context).semiBold18,
                    ),
                  ),
                  searchProvider.isSearchActive
                      ? getSearchGrid(context, searchProvider)
                      : getTopSearches(context, searchProvider)
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget getTextField(BuildContext context, SearchProvider searchProvider) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: SizedBox(
        height: 36,
        child: TextField(
          controller: searchProvider.textEditingController,
          cursorHeight: 20,
          cursorColor: CustomColors.of(context).textCursor,
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
            filled: true,
            fillColor: CustomColors.of(context).searchBackground,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 0,
                color: CustomColors.of(context).searchBackground,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 0,
                color: CustomColors.of(context).searchBackground,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            contentPadding: EdgeInsets.zero,
            suffixIconConstraints:
                const BoxConstraints.tightFor(width: 40, height: 36),
            suffixIcon: searchProvider.query.isEmpty
                ? GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                          context: context,
                          backgroundColor: CustomColors.of(context).background,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          builder: (context) {
                            return MovieSearchBottomSheet(
                              initialCategory: searchProvider.category.isEmpty
                                  ? null
                                  : searchProvider.category,
                              initialDuration: searchProvider.duration.isEmpty
                                  ? null
                                  : searchProvider.duration,
                              initialProductionYear:
                                  searchProvider.productionYear.isEmpty
                                      ? null
                                      : searchProvider.productionYear,
                              onCategoryChanged: (category) {
                                searchProvider.applyFilters(
                                    category: category,
                                    duration: null,
                                    productionYear: null);
                              },
                              onDurationChanged: (duration) {
                                searchProvider.applyFilters(
                                    category: null,
                                    duration: duration,
                                    productionYear: null);
                              },
                              onProductionYearChanged: (production) {
                                searchProvider.applyFilters(
                                    category: null,
                                    duration: null,
                                    productionYear: production);
                              },
                            );
                          });
                    },
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0.0,
                          right: 0.0,
                          top: 6.0,
                          bottom: 6.0,
                          child: Image.asset(
                            'assets/icons/icon_slider.png',
                            fit: BoxFit.contain,
                            color: CustomColors.of(context).hintText,
                          ),
                        ),
                        if (searchProvider.isFiltersActive)
                          Positioned(
                            top: 7.0,
                            right: 9.0,
                            height: 7.0,
                            width: 7.0,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                color: CustomColors.of(context).primary,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                      ],
                    ),
                  )
                : GestureDetector(
                    onTap: () {
                      searchProvider.clearQuery();
                    },
                    child: Image.asset(
                      'assets/icons/icon_close.png',
                      color: CustomColors.of(context).hintText,
                    ),
                  ),
            prefixIcon: Padding(
              padding: const EdgeInsets.only(left: 8, right: 6),
              child: SizedBox(
                height: 16,
                width: 16,
                child: Image.asset('assets/icons/icon_search.png',
                    color: CustomColors.of(context).hintText),
              ),
            ),
            hintText: 'search_hint_text'.tr(),
            hintStyle: CustomTextStyles.of(context)
                .regular17
                .apply(color: CustomColors.of(context).hintText),
            prefixIconConstraints: const BoxConstraints(
              maxWidth: 35,
            ),
          ),
          onChanged: (text) {
            searchProvider.search(text);
          },
        ),
      ),
    );
  }

  Widget getTopSearches(BuildContext context, SearchProvider searchProvider) {
    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: 2,
        itemBuilder: (context, index) {
          return getSearchCell(context, searchProvider.movies[index]);
        },
      ),
    );
  }

  Widget getSearchCell(BuildContext context, Movie movie) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        context.goNamed(MovieDetails.pageName, params: {'id': movie.id});
      },
      child: Container(
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
                  //generateTitle(context, downloadMovieCellProvider.downloadMovie),
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
      ),
    );
  }

  Widget getSearchGrid(BuildContext context, SearchProvider searchProvider) {
    if (searchProvider.searched.isEmpty) {
      return Padding(
        padding: const EdgeInsets.only(top: 32.0),
        child: Align(
          alignment: Alignment.topCenter,
          child: Text(
            'No results to display',
            textAlign: TextAlign.center,
            style: CustomTextStyles.of(context).semiBold24,
          ),
        ),
      );
    } else {
      return Expanded(
        child: Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
            itemCount: searchProvider.searched.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  context.pushNamed(MovieDetails.pageName, params: {
                    'id': searchProvider.searched.elementAt(index).id
                  });
                },
                child: SizedBox(
                  height: 138,
                  width: 108,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      searchProvider.searched.elementAt(index).coverImage,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      );
    }
  }
}
