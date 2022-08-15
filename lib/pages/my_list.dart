import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_wtc/extensions/custom_colors.dart';
import 'package:movie_wtc/extensions/custom_text_styles.dart';
import 'package:movie_wtc/pages/movie_details.dart';
import 'package:movie_wtc/providers/my_list_provider.dart';
import 'package:movie_wtc/widgets/custom_app_bar.dart';
import 'package:provider/provider.dart';

class MyListPage extends StatelessWidget {
  static const pageName = 'my_list';

  const MyListPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.of(context).background,
      appBar: const CustomAppBar(
        hasBackButton: true,
        hasSearchButton: true,
      ),
      body: ChangeNotifierProvider(
          create: ((context) => MyListProvider()),
          child: Consumer<MyListProvider>(
            builder: (context, myListProvider, child) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, bottom: 24),
                    child: Text(
                      'My List',
                      style: CustomTextStyles.of(context).semiBold24,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: myListProvider.myMovieList.isNotEmpty
                          ? GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                mainAxisExtent: 138,
                                crossAxisCount: 3,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                              ),
                              itemCount: myListProvider.myMovieList.length,
                              itemBuilder: (BuildContext ctx, index) {
                                final movie = myListProvider.myMovieList[index];
                                return ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: GestureDetector(
                                    onTap: () {
                                      context.pushNamed(MovieDetails.pageName,
                                          params: {'id': movie.id});
                                    },
                                    child: Image.asset(movie.coverImage,
                                        fit: BoxFit.cover),
                                  ),
                                );
                              })
                          : Center(
                              child: Text(
                                'my_list_no_movie'.tr(),
                                style: CustomTextStyles.of(context)
                                    .regular15
                                    .apply(
                                        color:
                                            CustomColors.of(context).inactive),
                              ),
                            ),
                    ),
                  ),
                ],
              );
            },
          )),
    );
  }
}
