import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_wtc/extensions/custom_colors.dart';
import 'package:movie_wtc/extensions/custom_text_styles.dart';
import 'package:movie_wtc/providers/downloads_provider.dart';
import 'package:movie_wtc/widgets/bottom_sheet_downloads.dart';
import 'package:movie_wtc/widgets/custom_app_bar.dart';
import 'package:movie_wtc/widgets/download_movie_cell.dart';
import 'package:provider/provider.dart';

class Downloads extends StatelessWidget {
  const Downloads({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DownloadsProvider(),
      child: Consumer<DownloadsProvider>(
        builder: (context, downloadsProvider, child) {
          return Column(
            children: [
              const SafeArea(
                  child: CustomAppBar(
                hasNotificationButton: true,
              )),
              Expanded(
                  child: renderPage(
                      context: context, downloadsProvider: downloadsProvider))
            ],
          );
        },
      ),
    );
  }

  Widget renderPage(
      {required BuildContext context,
      required DownloadsProvider downloadsProvider}) {
    return ListView.builder(
      padding: const EdgeInsets.only(top: 8, bottom: 16),
      itemCount: 2 + downloadsProvider.downloadedMovies.length,
      itemBuilder: (context, index) {
        final Widget widget;
        if (index == 0) {
          widget = Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text(
                      'downloads_title'.tr(),
                      style: CustomTextStyles.of(context).semiBold18,
                    ),
                  ),
                  const Spacer(),
                  CupertinoButton(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    onPressed: () {
                      downloadsProvider.clearDownloads();
                    },
                    child: SizedBox(
                      width: 24,
                      height: 24,
                      child: Image.asset(
                        'assets/icons/icon_trash.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          );
        } else if (index == 1) {
          widget = Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 8.0, left: 20, right: 20, bottom: 12),
              child: TextButton.icon(
                style: ButtonStyle(
                  alignment: Alignment.centerLeft,
                  padding: MaterialStateProperty.all(EdgeInsets.zero),
                ),
                onPressed: () {
                  showModalBottomSheet(
                    backgroundColor:
                        CustomColors.of(context).secondaryBackground,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    context: context,
                    builder: (context) => const BottomSheetDownloads(),
                  );
                },
                icon: Image.asset('assets/icons/icon_settings.png'),
                label: Text(
                  'downloads_smart'.tr(),
                  style: CustomTextStyles.of(context).regular12.apply(
                        color: CustomColors.of(context).inactive,
                      ),
                ),
              ),
            ),
          );
        } else {
          final downloadMovie = downloadsProvider.downloadedMovies[index - 2];
          widget = DownloadMovieCell(movie: downloadMovie.movie);
        }
        return widget;
      },
    );
  }
}
