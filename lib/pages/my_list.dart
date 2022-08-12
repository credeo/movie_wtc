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
              return Container(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'My List',
                      style: CustomTextStyles.of(context).semiBold24,
                    ),
                    const SizedBox(height: 24),
                    Expanded(
                      child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 10),
                          itemCount: myListProvider.myMovieList.length,
                          itemBuilder: (BuildContext ctx, index) {
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: GestureDetector(
                                onTap: () => context.pushNamed(
                                  MovieDetails.pageName,
                                  params: {
                                    'id': myListProvider.myMovieList[index].id
                                  },
                                ),
                                child: Image.asset(
                                  myListProvider.myMovieList[index].coverImage,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          }),
                    ),
                  ],
                ),
              );
            },
          )),
    );
  }
}
