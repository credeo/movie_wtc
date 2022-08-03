import 'package:flutter/cupertino.dart';

import 'package:movie_wtc/extensions/custom_colors.dart';
import 'package:movie_wtc/extensions/custom_text_styles.dart';
import 'package:movie_wtc/models/model_movie.dart';
import 'package:movie_wtc/widgets/custom_appbar.dart';
import 'package:movie_wtc/widgets/custom_button_with_icon.dart';
import 'package:movie_wtc/widgets/custom_secondary_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _controller = PageController();

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final scaleRatio = MediaQuery.of(context).size.height / 812.0;
    return Stack(
      children: [
        Positioned.fill(
          child: ListView(
            padding: const EdgeInsets.only(bottom: 32),
            children: [
              Container(
                height: 400.0 * scaleRatio,
                width: MediaQuery.of(context).size.width,
                child: PageView.builder(
                  onPageChanged: (index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  controller: _controller,
                  itemCount: models.length,
                  itemBuilder: (BuildContext context, int index) {
                    currentIndex = index;
                    return Stack(
                      children: [
                        Positioned.fill(
                          child: Image.asset(
                            models[index].imgAsset,
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
                                  CustomColors.of(context).coverGradientStart,
                                  CustomColors.of(context).coverGradientEnd,
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
                                  CustomColors.of(context).coverGradientStart,
                                  CustomColors.of(context).coverGradientEnd,
                                ],
                              ),
                            ),
                          ),
                        ),
                        const CustomAppBar(),
                        Positioned(
                          bottom: 0.0,
                          left: 0.0,
                          right: 0.0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                models[index].title,
                                style: CustomTextStyles.of(context).semiBold40,
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 16),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    models[index].genres,
                                    style:
                                        CustomTextStyles.of(context).regular12,
                                  ),
                                  Container(
                                    width: 4,
                                    height: 4,
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 8),
                                    decoration: BoxDecoration(
                                        color: CustomColors.of(context)
                                            .primaryText,
                                        shape: BoxShape.circle),
                                  ),
                                  Text(
                                    models[index].details,
                                    maxLines: 1,
                                    overflow: TextOverflow.fade,
                                    style:
                                        CustomTextStyles.of(context).regular12,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: CustomSecondaryButton(
                                        iconPath:
                                            'assets/icons/icon_checkmark.png',
                                        title: 'My list',
                                        onPressed: () {},
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 24.0),
                                    child: CustomButtonWithIcon(
                                      title: 'Play',
                                      width: 100,
                                      iconPath:
                                          'assets/icons/icon_play_filled.png',
                                      onPressed: () {},
                                    ),
                                  ),
                                  Expanded(
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: CustomSecondaryButton(
                                        iconPath: 'assets/icons/icon_info.png',
                                        title: 'Info',
                                        onPressed: () {},
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
                    controller: _controller, // PageController
                    count: 3,
                    effect: SlideEffect(
                      spacing: 12,
                      dotHeight: 6,
                      dotWidth: 6,
                      activeDotColor: CustomColors.of(context).primary,
                      dotColor: CustomColors.of(context).inactive,
                    ), // your preferred effect
                    onDotClicked: (index) {
                      _controller.jumpToPage(index);
                    }),
              ),
              const SizedBox(height: 12),
              buildCategoriesSection(context),
              const SizedBox(height: 12),
              buildMyListSection(context),
            ],
          ),
        ),

        // Align(
        //   alignment: Alignment.topCenter,
        //   child: AppBar(
        //     title: Text('TITLE'),
        //   ),
        // ),
      ],
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
                  'Categories',
                  style: CustomTextStyles.of(context).semiBold18,
                ),
              ),
              const Spacer(),
              CupertinoButton(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                child: Text(
                  'See More',
                  style: CustomTextStyles.of(context)
                      .regular12
                      .apply(color: CustomColors.of(context).primary),
                ),
                onPressed: () {
                  print('clicked see more');
                },
              ),
            ],
          ),
        ),
        const SizedBox(height: 4),
        SizedBox(
          height: 86,
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            scrollDirection: Axis.horizontal,
            itemCount: models.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        models[index].imgAsset,
                        fit: BoxFit.cover,
                        height: 64,
                        width: 64,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      models[index].genres,
                      style: CustomTextStyles.of(context).regular12,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget buildMyListSection(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 44,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20.0, bottom: 12, top: 12),
                child: Text(
                  'My List',
                  style: CustomTextStyles.of(context).semiBold18,
                ),
              ),
              const Spacer(),
              CupertinoButton(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                child: Text(
                  'See More',
                  style: CustomTextStyles.of(context)
                      .regular12
                      .apply(color: CustomColors.of(context).primary),
                ),
                onPressed: () {
                  print('clicked see more');
                },
              ),
            ],
          ),
        ),
        const SizedBox(height: 4),
        SizedBox(
          height: 250,
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            scrollDirection: Axis.horizontal,
            itemCount: models.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: SizedBox(
                  height: 184,
                  width: 136,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 182,
                        width: 140,
                        child: Image.asset(
                          models[index].imgAsset,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        models[index].title,
                        style: CustomTextStyles.of(context).medium14,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        models[index].subtitle,
                        style: CustomTextStyles.of(context).regular12,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
