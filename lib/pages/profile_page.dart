import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_wtc/extensions/custom_colors.dart';
import 'package:movie_wtc/extensions/custom_text_styles.dart';
import 'package:movie_wtc/pages/edit_profile.dart';
import 'package:movie_wtc/pages/login_page.dart';
import 'package:movie_wtc/pages/my_list.dart';
import 'package:movie_wtc/providers/profile_provider.dart';
import 'package:movie_wtc/widgets/custom_app_bar.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);
  static const pageName = 'profile';
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: ((context) => ProfileProvider()),
      child: Consumer<ProfileProvider>(
        builder: ((context, profileProvider, child) {
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
                            profileProvider.name,
                            style: CustomTextStyles.of(context).semiBold24,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'profile_email'.tr(),
                            style: CustomTextStyles.of(context).regular12.apply(
                                color: CustomColors.of(context).inactive),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                dividerForProfile(context),
                cellForProfile(
                    context: context,
                    iconName: 'assets/icons/icon_checkmark.png',
                    text: 'profile_my_list'.tr(),
                    onTap: () {
                      context.pushNamed(MyListPage.pageName);
                    }),
                dividerForProfile(context),
                cellForProfile(
                    context: context,
                    iconName: 'assets/icons/icon_edit.png',
                    text: 'profile_edit'.tr(),
                    onTap: () {
                      context.pushNamed(EditProfilePage.pageName);
                    }),
                dividerForProfile(context),
                cellForProfile(
                    context: context,
                    iconName: 'assets/icons/icon_ preferences.png',
                    text: 'profile_app_pref'.tr(),
                    onTap: () {}),
                dividerForProfile(context),
                cellForProfile(
                    context: context,
                    iconName: 'assets/icons/icon_help.png',
                    text: 'profile_help'.tr(),
                    onTap: () {}),
                dividerForProfile(context),
                cellForProfile(
                    context: context,
                    iconName: 'assets/icons/icon_logout.png',
                    text: 'profile_signout'.tr(),
                    onTap: () {
                      context.goNamed(LoginPage.pageName);
                    }),
                dividerForProfile(context),
              ],
            ),
          );
        }),
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
    {required BuildContext context,
    required String iconName,
    required String text,
    required VoidCallback onTap}) {
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
