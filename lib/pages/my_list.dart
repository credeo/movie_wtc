import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_wtc/extensions/custom_colors.dart';
import 'package:movie_wtc/extensions/custom_text_styles.dart';
import 'package:movie_wtc/models/movie.dart';
import 'package:movie_wtc/pages/tab_container.dart';
import 'package:movie_wtc/providers/home_provider.dart';
import 'package:movie_wtc/providers/my_list_provider.dart';
import 'package:movie_wtc/widgets/custom_app_bar.dart';
import 'package:provider/provider.dart';

class MyListPage extends StatelessWidget {
  static const pageName = 'my-list';

  const MyListPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.of(context).background,
      appBar: CustomAppBar(
        leftIcon: LeftIcon.backArrow,
        rightIcon: RightIcon.search,
        backButton: () {
          context.goNamed(TabContainer.pageName);
        },
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
                                  //childAspectRatio: 2 / 9,
                                  crossAxisCount: 3,
                                  mainAxisExtent: 154,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 10),
                          itemCount: myListProvider.myMovieList.length,
                          itemBuilder: (BuildContext ctx, index) {
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset(
                                myListProvider.myMovieList[index].coverImage,
                                fit: BoxFit.cover,
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
