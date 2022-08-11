import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_wtc/extensions/custom_colors.dart';
import 'package:movie_wtc/extensions/custom_text_styles.dart';
import 'package:movie_wtc/models/movie.dart';
import 'package:movie_wtc/pages/movie_details.dart';
import 'package:movie_wtc/providers/search_provider.dart';
import 'package:movie_wtc/widgets/custom_app_bar.dart';
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
              //padding: EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.only(left: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  getTextField(context, searchProvider),
                  Padding(
                    padding: const EdgeInsets.only(top: 16, bottom: 12),
                    child: Text(
                      searchProvider.controller.text == '' &&
                              searchProvider.areConditionsEmpty()
                          ? 'search_top_searches'.tr()
                          : 'search_movies_and_shows'.tr(),
                      style: CustomTextStyles.of(context).semiBold18,
                    ),
                  ),
                  searchProvider.controller.text == '' &&
                          searchProvider.areConditionsEmpty()
                      ? getTopSearches(context, searchProvider)
                      : getSearchGrid(context, searchProvider)
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
      child: TextField(
        cursorHeight: 20,
        cursorColor: CustomColors.of(context).textCursor,
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
                      return getBottomSheet(context, searchProvider);
                    });
              },
              child: Image.asset(
                'assets/icons/icon_slider.png',
              ),
            ),
          ),
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 8, right: 6),
            child: SizedBox(
              height: 16,
              width: 16,
              child: Image.asset(
                'assets/icons/icon_search_grey.png',
              ),
            ),
          ),
          prefixIconColor: CustomColors.of(context).hintText,
          hintText: 'search_hint_text'.tr(),
          hintStyle: CustomTextStyles.of(context)
              .regular17
              .apply(color: CustomColors.of(context).hintText),
          prefixIconConstraints: const BoxConstraints(
            maxWidth: 35,
          ),
        ),
        controller: searchProvider.controller,
        onChanged: (str) {
          searchProvider.search();
        },
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
            print(searchProvider.searched);
            return GestureDetector(
              onTap: () {
                context.goNamed(MovieDetails.pageName, params: {
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

  Widget getBottomSheet(BuildContext context, SearchProvider searchProvider) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 1.9, tileMode: TileMode.decal),
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
              color: CustomColors.of(context).searchDivider,
            ),
            const SizedBox(height: 13),
            getDropButtonRowString(
              context,
              searchProvider,
              'Category',
              searchProvider.categories,
            ),
            getDropButtonRowString(
              context,
              searchProvider,
              'Duration',
              searchProvider.durations,
            ),
            getDropButtonRowInt(
              context,
              searchProvider,
              'Production year',
            ),
          ],
        ),
      ),
    );
  }

  Widget getDropButtonRowString(
      BuildContext context,
      SearchProvider searchProvider,
      String title,
      List<DropdownMenuItem<String>> list) {
    return Padding(
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
              child: Text(
                title.toUpperCase(),
                style: CustomTextStyles.of(context).semiBold16,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 14.0),
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                  alignment: Alignment.centerRight,
                  hint: Text(
                    'Any',
                    style: CustomTextStyles.of(context).regular16.apply(
                          color: CustomColors.of(context).primary,
                        ),
                  ),
                  items: list,
                  value: title == 'Category'
                      ? searchProvider.category
                      : searchProvider.duration,
                  style: CustomTextStyles.of(context).regular16.apply(
                        color: CustomColors.of(context).primary,
                      ),
                  icon: const Text(''),
                  onChanged: (index) {
                    if (title == 'Category') {
                      searchProvider.setCategory(index as String);
                    } else {
                      searchProvider.setDuration(index as String);
                    }
                    searchProvider.searchBottomSheet();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getDropButtonRowInt(
      BuildContext context, SearchProvider searchProvider, String title) {
    return Padding(
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
              child: Text(
                title.toUpperCase(),
                style: CustomTextStyles.of(context).semiBold16,
              ),
            ),
            SizedBox(
              width: 50,
              child: TextField(
                onChanged: (text) {
                  searchProvider.searchBottomSheet();
                },
                controller: searchProvider.productionController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    border:
                        const OutlineInputBorder(borderSide: BorderSide.none),
                    contentPadding: const EdgeInsets.only(left: 10),
                    hintText: 'Any',
                    hintStyle: CustomTextStyles.of(context)
                        .regular16
                        .apply(color: CustomColors.of(context).primary)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
