import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_wtc/extensions/custom_colors.dart';
import 'package:movie_wtc/extensions/custom_text_styles.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: ListView(
            padding: EdgeInsets.only(bottom: 32),
            children: [
              Container(
                height: 400.0 * MediaQuery.of(context).size.height / 812.0,
                width: MediaQuery.of(context).size.width,
                color: Colors.yellow,
              ),
              const SizedBox(height: 8),
              Center(
                child: SmoothPageIndicator(
                    controller: PageController(), // PageController
                    count: 3,
                    effect: SlideEffect(
                      spacing: 12,
                      dotHeight: 6,
                      dotWidth: 6,
                      activeDotColor: CustomColors.of(context).primary,
                      dotColor: CustomColors.of(context).inactive,
                    ), // your preferred effect
                    onDotClicked: (index) {}),
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
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                child: Text(
                  'See More',
                  style: CustomTextStyles.of(context).regular12.apply(color: CustomColors.of(context).primary),
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
            itemCount: 10,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  children: [
                    Container(
                      width: 64,
                      height: 64,
                      color: Colors.blue,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Title',
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
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                child: Text(
                  'See More',
                  style: CustomTextStyles.of(context).regular12.apply(color: CustomColors.of(context).primary),
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
          height: 220,
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: SizedBox(
                  height: 220,
                  width: 136,
                  child: Column(
                    children: [
                      Expanded(
                        child: Container(
                          color: Colors.blue,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Title',
                        style: CustomTextStyles.of(context).medium14,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Subtitle',
                        style: CustomTextStyles.of(context).regular12,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
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
