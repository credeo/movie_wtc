import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leadingWidth: 112,
      leading: CupertinoButton(
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
        CupertinoButton(
          child: Image.asset('assets/icons/icon_notification.png'),
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
