import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_wtc/extensions/custom_colors.dart';
import 'package:movie_wtc/extensions/custom_text_styles.dart';
import 'package:movie_wtc/providers/notification_provider.dart';
import 'package:movie_wtc/widgets/custom_app_bar.dart';
import 'package:provider/provider.dart';

class NotificationPage extends StatelessWidget {
  static const pageName = 'notification';
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.of(context).background,
      appBar: const CustomAppBar(
        hasBackButton: true,
      ),
      body: ChangeNotifierProvider(
        create: (context) => NotificationProvider(),
        child: Consumer<NotificationProvider>(
          builder: (context, notificationProvider, child) {
            return Padding(
              padding: const EdgeInsets.only(left: 16.0, top: 20, right: 16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 54,
                        width: 54,
                        margin: const EdgeInsets.only(right: 12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          gradient: LinearGradient(
                            colors: [
                              CustomColors.of(context)
                                  .buttonBackgroundGradientEnd,
                              CustomColors.of(context)
                                  .buttonBackgroundGradientStart,
                            ],
                            end: Alignment.bottomLeft,
                            begin: Alignment.topCenter,
                          ),
                        ),
                        child: Image.asset(
                          'assets/icons/icon_notification_filled.png',
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'Notifications',
                          style: CustomTextStyles.of(context).semiBold24,
                        ),
                      ),
                      CupertinoButton(
                        padding: const EdgeInsets.only(left: 20, top: 7),
                        onPressed: notificationProvider.clearList,
                        child: Text(
                          'Clear All',
                          textAlign: TextAlign.end,
                          style: CustomTextStyles.of(context)
                              .regular15
                              .apply(color: CustomColors.of(context).primary),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 17),
                  Divider(
                      height: 1, color: CustomColors.of(context).searchDivider),
                  Expanded(
                    child: ListView.builder(
                      itemCount: notificationProvider.myMovieList.length,
                      itemBuilder: (context, index) {
                        return notificationCell(
                            context, notificationProvider, index);
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

String formatDateMonthDay(DateTime date) {
  final f = DateFormat('MMM d');
  return f.format(date);
}

Widget notificationCell(
    BuildContext context, NotificationProvider notPro, int index) {
  final movie = notPro.myMovieList[index];

  return Dismissible(
    key: Key(movie.title),
    background: const ColoredBox(color: Colors.transparent),
    secondaryBackground: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        gradient: LinearGradient(
          colors: [
            CustomColors.of(context).buttonBackgroundGradientEnd,
            CustomColors.of(context).buttonBackgroundGradientStart,
          ],
          end: Alignment.centerRight,
          begin: Alignment.centerLeft,
        ),
      ),
    ),
    direction: DismissDirection.endToStart,
    onDismissed: (direction) => notPro.removeMovieNotification(movie),
    child: Column(
      children: [
        const SizedBox(height: 17),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 54,
              width: 54,
              margin: const EdgeInsets.only(right: 12),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.asset(
                  movie.coverImage,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  formatDateMonthDay(movie.releaseDate),
                  style: CustomTextStyles.of(context).regular15,
                ),
                const SizedBox(height: 4),
                Text(
                  movie.releaseDate.year.toString(),
                  style: CustomTextStyles.of(context).regular15,
                ),
              ],
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.title,
                    style: CustomTextStyles.of(context).semiBold18,
                  ),
                  const SizedBox(height: 6),
                  Text(
                    movie.subtitle,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: CustomTextStyles.of(context)
                        .regular13
                        .apply(color: CustomColors.of(context).inactive),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 17),
        Divider(height: 1, color: CustomColors.of(context).searchDivider),
      ],
    ),
  );
}
