import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_wtc/extensions/custom_colors.dart';
import 'package:movie_wtc/extensions/custom_text_styles.dart';
import 'package:movie_wtc/models/movie.dart';
import 'package:movie_wtc/pages/movie_details.dart';
import 'package:movie_wtc/pages/movie_player.dart';
import 'package:movie_wtc/pages/my_list.dart';
import 'package:movie_wtc/pages/profile_page.dart';
import 'package:movie_wtc/pages/search.dart';
import 'package:movie_wtc/providers/home_provider.dart';
import 'package:movie_wtc/widgets/custom_button_with_icon.dart';
import 'package:movie_wtc/widgets/custom_secondary_button.dart';
import 'package:movie_wtc/widgets/movie_details_row.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final scaleRatio = MediaQuery.of(context).size.height / 812.0;
    final coverHeight = 400.0 * scaleRatio;
    return ChangeNotifierProvider(
      create: (context) => HomeProvider(),
      child: Consumer<HomeProvider>(
        builder: (context, homeProvider, child) {
          final Widget widget;
          switch (homeProvider.state) {
            case HomeState.loading:
              widget = Center(
                child: CircularProgressIndicator(
                  color: CustomColors.of(context).primary,
                ),
              );
              break;
            case HomeState.ready:
              widget = Stack(
                children: [
                  Positioned.fill(
                    child: ListView(
                      controller: homeProvider.scrollController,
                      padding: const EdgeInsets.only(bottom: 32),
                      children: [
                        SizedBox(
                          height: coverHeight,
                          width: MediaQuery.of(context).size.width,
                          child: PageView.builder(
                            controller: homeProvider.pageController,
                            itemCount: homeProvider.suggestedMovies.length,
                            itemBuilder: (context, index) {
                              final movie = homeProvider.suggestedMovies[index];
                              return Stack(
                                children: [
                                  Positioned.fill(
                                    child: Image.asset(
                                      movie.coverImage,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Positioned(
                                    top: 0.0,
                                    left: 0.0,
                                    right: 0.0,
                                    height: 148.0 * scaleRatio,
                                    child: DecoratedBox(
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                            CustomColors.of(context)
                                                .coverGradientStart,
                                            CustomColors.of(context)
                                                .coverGradientEnd,
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 0.0,
                                    left: 0.0,
                                    right: 0.0,
                                    height: 116.0 * scaleRatio,
                                    child: DecoratedBox(
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          begin: Alignment.bottomCenter,
                                          end: Alignment.topCenter,
                                          colors: [
                                            CustomColors.of(context)
                                                .coverGradientStart,
                                            CustomColors.of(context)
                                                .coverGradientEnd,
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 0.0,
                                    left: 0.0,
                                    right: 0.0,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          movie.title,
                                          style: CustomTextStyles.of(context)
                                              .semiBold40,
                                        ),
                                        const SizedBox(height: 16),
                                        MovieDetailsRow(
                                          leftText: movie.genres
                                              .map((e) => e.toLocalisedString())
                                              .join(' ')
                                              .toString(),
                                          rightText: movie.details,
                                        ),
                                        const SizedBox(height: 8),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              child: Align(
                                                alignment:
                                                    Alignment.centerRight,
                                                child: SizedBox(
                                                  width: 72,
                                                  child: homeProvider
                                                          .isMovieInMyList(
                                                              movie)
                                                      ? CustomSecondaryButton(
                                                          iconPath:
                                                              'assets/icons/icon_checkmark.png',
                                                          title:
                                                              'home_my_list_button'
                                                                  .tr(),
                                                          onPressed: () {
                                                            homeProvider
                                                                .removeMovieFromMyList(
                                                                    movie);
                                                          },
                                                        )
                                                      : CustomSecondaryButton(
                                                          iconPath:
                                                              'assets/icons/icon_plus_circle.png',
                                                          title:
                                                              'home_my_list_button'
                                                                  .tr(),
                                                          onPressed: () {
                                                            homeProvider
                                                                .addMovieToMyList(
                                                                    movie);
                                                          },
                                                        ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 24.0),
                                              child: CustomButtonWithIcon(
                                                title: 'home_play'.tr(),
                                                width: 100,
                                                iconPath:
                                                    'assets/icons/icon_play_filled.png',
                                                onPressed: () {
                                                  context.goNamed(
                                                      MoviePlayer
                                                          .pageNameFromHome,
                                                      extra: movie.id);
                                                },
                                              ),
                                            ),
                                            Expanded(
                                              child: Align(
                                                alignment: Alignment.centerLeft,
                                                child: SizedBox(
                                                  width: 72,
                                                  child: CustomSecondaryButton(
                                                    iconPath:
                                                        'assets/icons/icon_info.png',
                                                    title:
                                                        'home_info_button'.tr(),
                                                    onPressed: () {
                                                      context.goNamed(
                                                          MovieDetails.pageName,
                                                          params: {
                                                            'id': movie.id
                                                          });
                                                    },
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                        const SizedBox(height: 8),
                        Center(
                          child: SmoothPageIndicator(
                            controller: homeProvider.pageController,
                            count: homeProvider.suggestedMovies.length,
                            effect: SlideEffect(
                              spacing: 12,
                              dotHeight: 6,
                              dotWidth: 6,
                              activeDotColor: CustomColors.of(context).primary,
                              dotColor: CustomColors.of(context).inactive,
                            ), // your preferred effect
                          ),
                        ),
                        const SizedBox(height: 12),
                        buildCategoriesSection(context),
                        const SizedBox(height: 12),
                        buildMyListSection(
                            context: context, homeProvider: homeProvider),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 0.0,
                    left: 0.0,
                    right: 0.0,
                    child: Container(
                      height: kToolbarHeight +
                          MediaQuery.of(context).viewPadding.top,
                      color: CustomColors.of(context).background.withOpacity(
                          calculateAppBarOpacity(
                              homeProvider.scrollController.hasClients
                                  ? homeProvider.scrollController.offset
                                  : 0.0,
                              coverHeight)),
                      child: SafeArea(
                        child: AppBar(
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                          leadingWidth: 112,
                          leading: CupertinoButton(
                            padding: EdgeInsets.zero,
                            onPressed: null,
                            child: SizedBox(
                              height: 28,
                              width: 64,
                              child: Image.asset(
                                'assets/icons/icon_app.png',
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          actions: [
                            CupertinoButton(
                              child:
                                  Image.asset('assets/icons/icon_search.png'),
                              onPressed: () {
                                context.pushNamed(SearchPage.pageName);
                              },
                            ),
                            CupertinoButton(
                              child:
                                  Image.asset('assets/icons/icon_profile.png'),
                              onPressed: () {
                                context.pushNamed(ProfilePage.pageName);
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
              break;
          }
          return widget;
        },
      ),
    );
  }

  Widget categoriesWidget(
      {required BuildContext context,
      required String title,
      required String imagePath}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          SizedBox(
            width: 64,
            height: 64,
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(12.0)),
              child: Image.asset(
                imagePath,
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: CustomTextStyles.of(context).regular12,
          ),
        ],
      ),
    );
  }

  Widget buildCategoriesSection(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 44,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20.0, bottom: 12, top: 12),
                child: Text(
                  'home_categories'.tr(),
                  style: CustomTextStyles.of(context).semiBold18,
                ),
              ),
              const Spacer(),
              CupertinoButton(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                child: Text(
                  'home_see_more'.tr(),
                  style: CustomTextStyles.of(context)
                      .regular12
                      .apply(color: CustomColors.of(context).primary),
                ),
                onPressed: () {
                  print('clicked see moreii');
                },
              ),
            ],
          ),
        ),
        const SizedBox(height: 4),
        SizedBox(
          height: 86,
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            scrollDirection: Axis.horizontal,
            children: [
              ...Genre.values.map((genre) => categoriesWidget(
                    context: context,
                    title: genre.toLocalisedString(),
                    imagePath: genre.getThumbnailPath(),
                  )),
            ],
          ),
        ),
      ],
    );
  }

  Widget myListWidget({
    required BuildContext context,
    required String title,
    required String subtitle,
    required String imagePath,
    required VoidCallback callback,
  }) {
    return GestureDetector(
      onTap: callback,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: SizedBox(
          height: 220,
          width: 136,
          child: Column(
            children: [
              Expanded(
                child: SizedBox(
                  width: 179,
                  height: 134,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                    child: Image.asset(
                      imagePath,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                title,
                style: CustomTextStyles.of(context).medium14,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 8),
              Text(
                subtitle,
                style: CustomTextStyles.of(context).regular12,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildMyListSection(
      {required BuildContext context, required HomeProvider homeProvider}) {
    return Column(
      children: [
        SizedBox(
          height: 44,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20.0, bottom: 12, top: 12),
                child: Text(
                  'home_my_list'.tr(),
                  style: CustomTextStyles.of(context).semiBold18,
                ),
              ),
              const Spacer(),
              CupertinoButton(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                child: Text(
                  'home_see_more'.tr(),
                  style: CustomTextStyles.of(context)
                      .regular12
                      .apply(color: CustomColors.of(context).primary),
                ),
                onPressed: () {
                  context.pushNamed(MyListPage.pageName);
                },
              ),
            ],
          ),
        ),
        const SizedBox(height: 4),
        if (homeProvider.myMovieList.isEmpty)
          Text(
            'no movies in my list',
            style: CustomTextStyles.of(context).regular12,
          )
        else
          SizedBox(
            height: 220,
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              scrollDirection: Axis.horizontal,
              itemCount: homeProvider.myMovieList.length,
              itemBuilder: (context, index) {
                final movie = homeProvider.myMovieList[index];
                return myListWidget(
                  context: context,
                  title: movie.title,
                  subtitle: movie.subtitle,
                  imagePath: movie.coverImage,
                  callback: () {
                    print('clicked on my movie tile');
                    context.pushNamed(MovieDetails.pageName,
                        params: {'id': movie.id});
                  },
                );
              },
            ),
          ),
      ],
    );
  }

  double calculateAppBarOpacity(double scrollOffset, double coverHeight) {
    final perc = (scrollOffset / coverHeight).clamp(0.0, 1.0);
    return perc;
  }
}
