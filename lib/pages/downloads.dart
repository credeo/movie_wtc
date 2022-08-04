import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_wtc/extensions/custom_colors.dart';
import 'package:movie_wtc/extensions/custom_text_styles.dart';
import 'package:movie_wtc/models/movie.dart';
import 'package:movie_wtc/providers/downloads_provider.dart';
import 'package:movie_wtc/widgets/custom_app_bar.dart';
import 'package:movie_wtc/widgets/downloads_bottom_sheet.dart';
import 'package:provider/provider.dart';

class Downloads extends StatelessWidget {
  const Downloads({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SafeArea(child: CustomAppBar()),
        const SizedBox(height: 8),
        Expanded(
          child: renderDownloadPage(context),
        ),
      ],
    );
  }

  Widget renderDownloadPage(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DownloadProvider(),
      child: Consumer<DownloadProvider>(
        builder: (context, downloadProvider, child) {
          print('uso u consumer builder');
          return ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: 1 + downloadProvider.downloadMovies.length,
            itemBuilder: (context, index) {
              final Widget widget;
              if (index == 0) {
                print(index);
                widget = buildFirstDownloadCell(context);
              } else {
                final movies = downloadProvider.downloadMovies[index - 1];
                widget = buildDownloadCell(context, movies);
                print('$index uso u index+1');
              }
              return widget;
            },
          );
        },
      ),
    );
  }
}

Widget buildDownloadCell(BuildContext context, Movie movie) {
  return Padding(
    padding: const EdgeInsets.only(left: 12, right: 8),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              height: 60,
              width: 100,
              margin: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(
                  Radius.circular(4),
                ),
                child: Image.asset(
                  movie.coverImage,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  movie.title,
                  style: CustomTextStyles.of(context).medium12,
                ),
                const SizedBox(height: 8),
                Text(
                  '${movie.details} | ${movie.duration.toString()}min | ${movie.downloadSize.toString()}mb',
                  style: CustomTextStyles.of(context)
                      .regular10
                      .apply(color: CustomColors.of(context).inactive),
                ),
              ],
            ),
          ],
        ),
        CupertinoButton(
          child: Icon(Icons.arrow_forward_ios,
              color: CustomColors.of(context).primaryText),
          onPressed: () {
            print('object');
          },
        ),
      ],
    ),
  );
}

Widget buildFirstDownloadCell(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(left: 20, right: 25),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'downloads_downloads'.tr(),
              style: CustomTextStyles.of(context).semiBold18,
            ),
            IconButton(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.zero,
              onPressed: () {},
              icon: Image.asset(
                'assets/icons/icon_edit_download.png',
              ),
            ),
          ],
        ),
        TextButton.icon(
          style: ButtonStyle(
            alignment: Alignment.centerLeft,
            padding: MaterialStateProperty.all(EdgeInsets.zero),
          ),
          onPressed: () {
            buildBootomSheet(context);
          },
          icon: Image.asset('assets/icons/icon_settings-check.png'),
          label: Text(
            'downloads_smart'.tr(),
            style: CustomTextStyles.of(context)
                .regular12
                .apply(color: CustomColors.of(context).inactive),
          ),
        ),
      ],
    ),
  );
}

// Widget onClick(int duration) {
//   Future.delayed(Duration(seconds: 5),() {

//   },);
// final List<int> list=[10,20,30,40,50,60,100,200];
