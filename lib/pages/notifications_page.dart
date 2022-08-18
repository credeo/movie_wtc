// ignore_for_file: prefer_single_quotes

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:movie_wtc/extensions/custom_colors.dart';
import 'package:movie_wtc/providers/notification_provider.dart';
import 'package:movie_wtc/widgets/custom_app_bar.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_wtc/extensions/custom_text_styles.dart';
import 'package:movie_wtc/pages/movie_details.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

/* ako mi ne radi pushup notif da imam nesto
class NotificationsPage extends StatelessWidget {
  static const pageName = 'notifications page';

  const NotificationsPage({Key? key}) : super(key: key);

 
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => NotificationsProvider(),
        child: Consumer<NotificationsProvider>(
            builder: (context, NotificationsProvider, child) {
          return Scaffold(
            backgroundColor: CustomColors.of(context).background,
            appBar: const CustomAppBar(hasBackButton: true),
            body: ListView.builder(
              itemCount: NotificationsProvider.notifyUserList.length,
              itemBuilder: (context, index) {
                final movie = NotificationsProvider.notifyUserList[index];
                return GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  //on tap->pokusaj push notif da ubacis
                  onTap: () {
                    context.pushNamed(MovieDetails.pageName,
                        params: {'ID': movie.id});

                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 14),
                    height: 70,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: SizedBox(
                              width: 100,
                              child: Image.asset(movie.coverImage,
                                  fit: BoxFit.cover),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            movie.title,
                            style: CustomTextStyles.of(context).semiBold24,
                            overflow: TextOverflow.visible,
                            maxLines: 2,
                          ),
                        ),
                        Text(
                          'movie coming soon in ${movie.releaseDate.difference(DateTime.now()).inDays.toString}days',
                          style: CustomTextStyles.of(context).medium14.apply(
                            color: CustomColors.of(context).primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        }));
  }
}*/

// ignore: non_constant_identifier_names
class NotificationsPage extends StatefulWidget {
  static const pageName = 'notifications page';

  const NotificationsPage({Key? key}) : super(key: key);

  @override
  State<NotificationsPage> createState() => __NotificationAppState();
}

class __NotificationAppState extends State<NotificationsPage> {
  late FlutterLocalNotificationsPlugin localNotification;
  @override
  void initState() {
    // TODO: inicijaliz android settings , uzima parametar za naziv ikonice
    //ikonica je i u drawable

    var androidInitialize = new AndroidInitializationSettings('icon_app');
    //pokusaj i za IOS
    var iOSInitialize = new IOSInitializationSettings();
    var initializationSettings = new InitializationSettings(
        android: androidInitialize, iOS: iOSInitialize);
    localNotification = new FlutterLocalNotificationsPlugin();
    localNotification.initialize(initializationSettings);
  }

  Future _showNotification() async {
    // ignore: prefer_const_constructors
    // ignore: unnecessary_new
    var androidDetails = new AndroidNotificationDetails(
        "channelID", "Local Notification",
        importance: Importance.high);
    var iosDetails = new IOSNotificationDetails();
    var generalNotificationDetails =
        new NotificationDetails(android: androidDetails, iOS: iosDetails);
    await localNotification.show(
        0, "Notif title", "Notification body", generalNotificationDetails);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => NotificationsProvider(),
        child: Consumer<NotificationsProvider>(
            builder: (context, NotificationsProvider, child) {
          return Scaffold(
            backgroundColor: CustomColors.of(context).background,
            appBar: const CustomAppBar(hasBackButton: true),
            body: ListView.builder(
              itemCount: NotificationsProvider.notifyUserList.length,
              itemBuilder: (context, index) {
                final movie = NotificationsProvider.notifyUserList[index];
                return GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  //on tap->pokusaj push notif da ubacis
                  onTap: () {
                    _showNotification();
                    context.pushNamed(MovieDetails.pageName,
                        params: {'ID': movie.id});
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 14),
                    height: 70,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: SizedBox(
                              width: 100,
                              child: Image.asset(movie.coverImage,
                                  fit: BoxFit.cover),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            movie.title,
                            style: CustomTextStyles.of(context).semiBold24,
                            overflow: TextOverflow.visible,
                            maxLines: 2,
                          ),
                        ),
                        Text(
                          'movie coming soon in ${movie.releaseDate.difference(DateTime.now()).inDays.toString}days',
                          style: CustomTextStyles.of(context).medium14.apply(
                                color: CustomColors.of(context).primary,
                              ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        }));
  }
}
