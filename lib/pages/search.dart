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
  static const pageName = '/search';

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
              padding: EdgeInsets.only(left: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  getTextField(context, searchProvider),
                  Padding(
                    padding: EdgeInsets.only(top: 16, bottom: 12),
                    child: Text(
                      'Top Searches',
                      style: CustomTextStyles.of(context).semiBold18,
                    ),
                  ),
                  searchProvider.controller.text == ''
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
        decoration: InputDecoration(
          filled: true,
          fillColor: Color(0x18767680),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              width: 0,
              color: Color(0x18767680),
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              width: 0,
              color: Color(0x18767680),
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          contentPadding: EdgeInsets.zero,
          suffixIcon: SizedBox(
            height: 16,
            width: 16,
            child: Image.asset(
              'assets/icons/icon_slider.png',
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
          prefixIconColor: Color(0xFFEBEBF5).withOpacity(0.6),
          hintText: 'Search for a show, movie, genre,...',
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
              child: Container(
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
