import 'package:flutter/material.dart';
import 'package:movie_wtc/extensions/custom_colors.dart';
import 'package:movie_wtc/providers/notifications_provider.dart';
import 'package:movie_wtc/widgets/custom_app_bar.dart';
import 'package:provider/provider.dart';

class NotificationsPage extends StatelessWidget {
  static const pageName = 'notifications';

  const NotificationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NotificationsProvider(),
      child: Consumer<NotificationsProvider>(
        builder: (context, notificationsProvider, child) {
          return Scaffold(
            backgroundColor: CustomColors.of(context).background,
            appBar: CustomAppBar(hasBackButton: true),
            body: ListView.builder(
              itemCount: notificationsProvider.notifyMeList.length,
              itemBuilder: (context, index) {
                return Text('janko');
              },
            ),
          );
        },
      ),
    );
  }
}
