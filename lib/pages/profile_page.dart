import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_wtc/extensions/custom_colors.dart';
import 'package:movie_wtc/extensions/custom_text_styles.dart';
import 'package:movie_wtc/pages/edit_profile.dart';
import 'package:movie_wtc/pages/login_page.dart';
import 'package:movie_wtc/pages/my_list.dart';
import 'package:movie_wtc/widgets/custom_app_bar.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);
  static const pageName = 'profile';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.of(context).background,
      appBar: const CustomAppBar(
        isProfilePage: true,
        hasNotificationButton: true,
        hasBackButton: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 8, bottom: 8),
            child: Row(
              children: [
                Image.asset(
                  'assets/icons/icon_profile_big.png',
                  fit: BoxFit.contain,
                ),
                const SizedBox(width: 20),
                Column(
                  children: [
                    Text(
                      'Albert Flores',
                      style: CustomTextStyles.of(context).semiBold24,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'albert.flores@example.com',
                      style: CustomTextStyles.of(context)
                          .regular12
                          .apply(color: CustomColors.of(context).inactive),
                    ),
                  ],
                )
              ],
            ),
          ),
          dividerForProfile(context),
          cellForProfile(context, 'assets/icons/icon_checkmark.png', 'My List',
              () {
            context.pushNamed(MyListPage.pageName);
          }),
          dividerForProfile(context),
          cellForProfile(context, 'assets/icons/icon_edit.png', 'Edit Profile',
              () {
            context.pushNamed(EditProfilePage.pageName);
          }),
          dividerForProfile(context),
          cellForProfile(context, 'assets/icons/icon_ preferences.png',
              'App Preferences', () {}),
          dividerForProfile(context),
          cellForProfile(context, 'assets/icons/icon_help.png', 'Help', () {}),
          dividerForProfile(context),
          cellForProfile(context, 'assets/icons/icon_logout.png', 'Sign Out',
              () {
            context.goNamed(LoginPage.pageName);
          }),
          dividerForProfile(context),
        ],
      ),
    );
  }
}

Divider dividerForProfile(BuildContext context) {
  return Divider(
    height: 44,
    color: CustomColors.of(context).dividerProfile.withOpacity(0.2),
  );
}

GestureDetector cellForProfile(
    BuildContext context, String iconName, String text, VoidCallback onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Padding(
      padding: const EdgeInsets.only(left: 23),
      child: Row(
        children: [
          Image.asset(iconName, color: Colors.white),
          const SizedBox(width: 20),
          Text(text, style: CustomTextStyles.of(context).regular12),
        ],
      ),
    ),
  );
}
