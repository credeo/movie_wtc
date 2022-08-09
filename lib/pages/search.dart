import 'package:flutter/material.dart';
import 'package:movie_wtc/extensions/custom_colors.dart';
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
              child: Column(
                children: [
                  getTextField(context, searchProvider),
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
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
}
