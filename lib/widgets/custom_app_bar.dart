import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_wtc/pages/notifications.dart';
import 'package:movie_wtc/pages/profile.dart';
import 'package:movie_wtc/pages/search.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool hasBackButton;
  final bool hasSearchButton;
  final bool hasNotificationButton;
  final bool isProfilePage;
  final Color? backgroundColor;

  const CustomAppBar({
    super.key,
    this.hasBackButton = false,
    this.hasSearchButton = false,
    this.hasNotificationButton = false,
    this.isProfilePage = false,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor ?? Colors.transparent,
      elevation: 0,
      leadingWidth: hasBackButton ? 72 : 112,
      automaticallyImplyLeading: false,
      leading: hasBackButton
          ? CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                context.pop();
              },
              child: SizedBox(
                height: 24,
                width: 24,
                child: Image.asset(
                  'assets/icons/icon_arrow_back.png',
                  fit: BoxFit.contain,
                ),
              ),
            )
          : CupertinoButton(
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
        if (hasSearchButton)
          CupertinoButton(
            child: Image.asset('assets/icons/icon_search.png'),
            onPressed: () {
              context.pushNamed(SearchPage.pageName);
            },
          ),
        if (hasNotificationButton)
          CupertinoButton(
            child: Image.asset('assets/icons/icon_notification_filled.png'),
            onPressed: () {
              context.pushNamed(Notifications.pageName);
            },
          ),
        CupertinoButton(
          child: Image.asset('assets/icons/icon_profile.png'),
          onPressed: () {
            if (!isProfilePage) context.pushNamed(ProfilePage.pageName);
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
