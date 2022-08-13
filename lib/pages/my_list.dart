import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_wtc/extensions/custom_colors.dart';
import 'package:movie_wtc/extensions/custom_text_styles.dart';
import 'package:movie_wtc/providers/my_list_provider.dart';
import 'package:movie_wtc/widgets/custom_app_bar.dart';
import 'package:provider/provider.dart';

import 'movie_details.dart';

class MyListPage extends StatelessWidget {
  static const pageName = "my_list";

  const MyListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyListProvider(),
      child: Consumer<MyListProvider>(
        builder: (context, myListProvider, child) {
          return Scaffold(
              backgroundColor: CustomColors.of(context).background,
              appBar: CustomAppBar(
                hasBackButton: true,
                hasSearchButton: true,
              ),
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'My List',
                        style: CustomTextStyles.of(context).semiBold24,
                      ),
                    ),
                    SizedBox(height: 24),
                    Expanded(
                      child: myListProvider.myMovies.isNotEmpty
                          ? GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                mainAxisSpacing: 10,
                                crossAxisSpacing: 10,
                              ),
                              itemCount: myListProvider.myMovies.length,
                              itemBuilder: (context, index) {
                                final movie = myListProvider.myMovies[index];
                                return GestureDetector(
                                  onTap: () {
                                    context.pushNamed(MovieDetails.pageName,
                                        params: {'id': movie.id});
                                  },
                                  child: SizedBox(
                                    height: 138,
                                    width: 108,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Image.asset(
                                        movie.coverImage,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                );
                              })
                          : Center(
                              child: Text(
                                'No movies in my list',
                                style: CustomTextStyles.of(context).semiBold24,
                              ),
                            ),
                    )
                  ],
                ),
              ));
        },
      ),
    );
  }
}
