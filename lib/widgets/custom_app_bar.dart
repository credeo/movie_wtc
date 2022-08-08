import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum LeftIcon { backArrow, appLogo }

enum RightIcon { notification, search }

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.leftIcon,
    required this.rightIcon,
    required this.backButton,
  });
  final LeftIcon leftIcon;
  final RightIcon rightIcon;

  final VoidCallback? backButton;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leadingWidth: 112,
      leading: CupertinoButton(
        padding: EdgeInsets.zero,
        onPressed: backButton,
        child: leftIcon == LeftIcon.appLogo
            ? SizedBox(
                height: 28,
                width: 64,
                child: Image.asset(
                  'assets/icons/icon_app.png',
                  fit: BoxFit.contain,
                ),
              )
            : Container(
                margin: const EdgeInsets.only(right: 50),
                height: 16,
                width: 19,
                child: Image.asset(
                  'assets/icons/icon_back_arrow.png',
                  fit: BoxFit.contain,
                ),
              ),
      ),
      actions: [
        CupertinoButton(
          child: rightIcon == RightIcon.notification
              ? Image.asset('assets/icons/icon_notification.png')
              : Image.asset('assets/icons/icon_search.png'),
          onPressed: () {},
        ),
        CupertinoButton(
          child: Image.asset('assets/icons/icon_profile.png'),
          onPressed: () {},
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
