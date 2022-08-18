import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_wtc/extensions/custom_colors.dart';
import 'package:movie_wtc/extensions/custom_text_styles.dart';
import 'package:movie_wtc/pages/movie_details.dart';
import 'package:movie_wtc/providers/notifications_provider.dart';
import 'package:movie_wtc/widgets/custom_app_bar.dart';
import 'package:provider/provider.dart';

class Notifications extends StatelessWidget {
  static const pageName = 'notification';
  const Notifications({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.of(context).background,
      appBar: const CustomAppBar(
        hasBackButton: true,
      ),
      body: ChangeNotifierProvider(
        create: (context) => NotificationsProvider(),
        child: Consumer<NotificationsProvider>(
          builder: (context, notificationProvider, child) {
            return Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Row(
                      children: [
                        Text(
                          'notifications_title'.tr(),
                          style: CustomTextStyles.of(context).semiBold18,
                        ),
                        const Spacer(),
                        CupertinoButton(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          onPressed: () {
                            notificationProvider.clearList();
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
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: ListView.builder(
                      itemCount: notificationProvider.notificationList.length,
                      itemBuilder: (context, index) {
                        return notificationCell(
                          context,
                          notificationProvider,
                          index,
                          padding: 16,
                          onPressed: () {
                            context.pushNamed(
                              MovieDetails.pageName,
                              params: {'id': notificationProvider.notificationList[index].id},
                            );
                          },
                        );
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
  final f = DateFormat('MMM dd');
  return f.format(date);
}

Widget notificationCell(
  BuildContext context,
  NotificationsProvider notPro,
  int index, {
  VoidCallback? onPressed,
  double? padding,
}) {
  final movie = notPro.notificationList[index];

  return GestureDetector(
    onTap: onPressed,
    behavior: HitTestBehavior.opaque,
    child: Dismissible(
      key: ValueKey(movie.id),
      background: const ColoredBox(color: Colors.transparent),
      secondaryBackground: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              CustomColors.of(context).error,
              CustomColors.of(context).error.withOpacity(0.7),
            ],
            end: Alignment.centerRight,
            begin: Alignment.centerLeft,
          ),
        ),
      ),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) => notPro.removeMovieNotification(movie),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: padding ?? 0.0),
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
                        style: CustomTextStyles.of(context).regular13.apply(color: CustomColors.of(context).inactive),
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
      ),
    ),
  );
}
