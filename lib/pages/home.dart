import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_wtc/extensions/custom_colors.dart';
import 'package:movie_wtc/extensions/custom_text_styles.dart';
import 'package:movie_wtc/providers/home_page_controller.dart';
import 'package:movie_wtc/widgets/custom_button_with_icon.dart';
import 'package:movie_wtc/widgets/custom_secondary_button.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  @override
  Widget build(BuildContext context) {
    final scaleRatio = MediaQuery.of(context).size.height / 812.0;
    return Stack(
      children: [
        Positioned.fill(
                child: ChangeNotifierProvider(
                create: (context)=>HomePageProvider(),
                  child: Consumer<HomePageProvider>(
                    builder: (context,homePageProvider,child){
                    return ListView(
                      padding: EdgeInsets.only(bottom: 32),
                      children: [
                        SizedBox(
                          height: 440,
                          child: PageView(
                            controller: homePageProvider.controller,
                            onPageChanged:(index){homePageProvider.index=index;},
                            children: [
                              coverWidget(
                                  context: context,
                                  imagePath: 'assets/images/movie_cover_1.jpg',
                                  genre: 'Zanr1',
                                  title: "Film1",
                                  details: "Detalji1",
                                  scaleRatio: scaleRatio),
                              coverWidget(
                                  context: context,
                                  imagePath: 'assets/images/movie_cover_1.jpg',
                                  genre: 'Zanr2',
                                  title: "Film2",
                                  details: "Detalji2",
                                  scaleRatio: scaleRatio),
                              coverWidget(
                                  context: context,
                                  imagePath: 'assets/images/movie_cover_1.jpg',
                                  genre: 'Zanr3',
                                  title: "Film3",
                                  details: "Detalji3",
                                  scaleRatio: scaleRatio),
                            ],
                          ),
                        ),
                        const SizedBox(height: 8),
                        Center(
                          child: SmoothPageIndicator(
                              controller: homePageProvider.controller, // PageController
                              count: 3,
                              effect: SlideEffect(
                                spacing: 12,
                                dotHeight: 6,
                                dotWidth: 6,
                                activeDotColor: CustomColors
                                    .of(context)
                                    .primary,
                                dotColor: CustomColors
                                    .of(context)
                                    .inactive,
                              ),
                              onDotClicked: (index) {

                              },
                        )),
                        const SizedBox(height: 12),
                        buildCategoriesSection(context),
                        const SizedBox(height: 12),
                        buildMyListSection(context),
                      ],);}
                  ),
                )
                ),
    ]
          );

  }

  Widget categoriesWidget({required BuildContext context,required String title,required String imagePath,required VoidCallback callback}){
  return GestureDetector(
    onTap:callback,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          Container(
            width: 64,
            height: 64,
            child: ClipRRect(child: Image.asset(imagePath,fit: BoxFit.fitWidth,),borderRadius: BorderRadius.all(Radius.circular(12.0)),),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: CustomTextStyles.of(context).regular12,
          ),
        ],
      ),
    ),
  );;
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
                  'categories'.tr(),
                  style: CustomTextStyles.of(context).semiBold18,
                ),
              ),
              const Spacer(),
              CupertinoButton(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                child: Text(
                  'see_more'.tr(),
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
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            scrollDirection: Axis.horizontal,
            children: [categoriesWidget(context: context, title: "Comedy", imagePath: "assets/images/categories/icon_comedy.png",callback: (){print("Comedy");}),
              categoriesWidget(context: context, title: "Horror", imagePath: "assets/images/categories/icon_horror.png",callback: (){print("Horror");}),
              categoriesWidget(context: context, title: "Romance", imagePath: "assets/images/categories/icon_romance.png",callback: (){print("Romance");}),
              categoriesWidget(context: context, title: "Action", imagePath: "assets/images/categories/icon_action.png",callback: (){print("Action");}),
              categoriesWidget(context: context, title: "Mystery", imagePath: "assets/images/categories/icon_mystery.png",callback: (){print("Mystery");}),
              categoriesWidget(context: context, title: "Sci-fi", imagePath: "assets/images/categories/icon_scifi.png",callback: (){print("Sci-fi");}),
            ],

          ),
        ),
      ],
    );
  }

  myListWidget({required BuildContext context, required String title ,required String subtitle ,required String imagePath, required VoidCallback callback}){
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
                child: Container(
                  width:179,
                  height:134,
                  child: ClipRRect(child: Image.asset(imagePath,fit: BoxFit.fitWidth,),borderRadius: BorderRadius.all(Radius.circular(12.0)),),
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
                  'my_list'.tr(),
                  style: CustomTextStyles.of(context).semiBold18,
                ),
              ),
              const Spacer(),
              CupertinoButton(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                child: Text(
                  'see_more'.tr(),
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
          height: 220,
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            scrollDirection: Axis.horizontal,
            children: [
              myListWidget(context: context, title: "Avatar", subtitle:"Movie about creatures with blue skin", imagePath: "assets/images/my_list/icon_avatar.png", callback:(){print("Avatar");}),
              myListWidget(context: context, title: "Bridgeton", subtitle:"Wealth, lust, and betrayal set against the backdrop of Regency-era England, seen through the eyes of the powerful Bridgerton family.", imagePath: "assets/images/my_list/icon_bridgeton.png", callback:(){print("Bridgeton");}),
              myListWidget(context: context, title: "The Queen's Gambit", subtitle:"TV Show based on chess move", imagePath: "assets/images/my_list/icon_queens_gambit.png", callback:(){print("Queens");}),
              myListWidget(context: context, title: "The Good Doctor", subtitle:"TV Show about authistic doctor", imagePath: "assets/images/my_list/icon_good_doctor.png", callback:(){print("Good Doctor");}),
            ],

          ),
        ),
      ],
    );
  }

  Widget coverWidget(
      {required String details,
      required String imagePath,
      required String genre,
      required double scaleRatio,
      required String title,
      required BuildContext context}) {
    return Container(
      height: 400.0 * scaleRatio,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              imagePath,
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
          Positioned(
            bottom: 0.0,
            left: 0.0,
            right: 0.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: CustomTextStyles.of(context).semiBold40,
                ),
                const SizedBox(height: 16),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      genre,
                      style: CustomTextStyles.of(context).regular12,
                    ),
                    Container(
                      width: 4,
                      height: 4,
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                          color: CustomColors.of(context).primaryText,
                          shape: BoxShape.circle),
                    ),
                    Text(
                      details,
                      style: CustomTextStyles.of(context).regular12,
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
                          iconPath: 'assets/icons/icon_checkmark.png',
                          title: 'my_list_button'.tr(),
                          onPressed: () {},
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: CustomButtonWithIcon(
                        title: 'play'.tr(),
                        width: 100,
                        iconPath: 'assets/icons/icon_play_filled.png',
                        onPressed: () {},
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: CustomSecondaryButton(
                          iconPath: 'assets/icons/icon_info.png',
                          title: 'info_button'.tr(),
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
      ),
    );
  }
}
