import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_wtc/extensions/custom_colors.dart';
import 'package:movie_wtc/extensions/custom_text_styles.dart';
import 'package:movie_wtc/pages/edit_profile.dart';
import 'package:movie_wtc/pages/login_page.dart';
import 'package:movie_wtc/pages/my_list.dart';
import 'package:movie_wtc/pages/tab_container.dart';
import 'package:movie_wtc/providers/profile_provider.dart';
import 'package:movie_wtc/widgets/custom_app_bar.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfilePage extends StatelessWidget {
  static const pageName = 'profile';

  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProfileProvider(),
      child: Consumer<ProfileProvider>(
        builder: (context, profileProvider, child) {
          return Scaffold(
            backgroundColor: CustomColors.of(context).background,
            appBar: const CustomAppBar(
              hasNotificationButton: true,
              hasBackButton: true,
              isProfilePage: true,
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 16.0, bottom: 28, left: 20, right: 20),
                    child: Row(
                      children: [
                        SizedBox(
                          height: 68,
                          width: 68,
                          child: Image.asset(
                            'assets/icons/icon_profile_medium.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              profileProvider.name,
                              style: CustomTextStyles.of(context).semiBold24,
                            ),
                            Text(
                              profileProvider.email,
                              style: CustomTextStyles.of(context)
                                  .regular12
                                  .apply(
                                      color: CustomColors.of(context).inactive),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Divider(
                    height: 1,
                    color: CustomColors.of(context).inactive.withOpacity(0.25),
                  ),
                  getRow(
                    context: context,
                    text: 'profile_my_list'.tr(),
                    iconPath: 'assets/icons/icon_checkmark.png',
                    callback: () {
                      context.pushNamed(MyListPage.pageName);
                    },
                  ),
                  getRow(
                    context: context,
                    text: 'profile_edit'.tr(),
                    iconPath: 'assets/icons/icon_edit.png',
                    callback: () {
                      context.pushNamed(EditProfilePage.pageName);
                    },
                  ),
                  getRow(
                    context: context,
                    text: 'profile_app_pref'.tr(),
                    iconPath: 'assets/icons/icon_preferences.png',
                    callback: () {},
                  ),
                  getRow(
                    context: context,
                    text: 'profile_help'.tr(),
                    iconPath: 'assets/icons/icon_help.png',
                    callback: () async {
                      Uri url = Uri.parse('http://flutter.dev');
                      if (await canLaunchUrl(url)) {
                        await launchUrl(url,
                            mode: LaunchMode.externalApplication);
                      }
                    },
                  ),
                  getRow(
                    context: context,
                    text: 'profile_signout'.tr(),
                    iconPath: 'assets/icons/icon_logout.png',
                    callback: () {
                      context.goNamed(LoginPage.pageName);
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget getRow({
    required VoidCallback callback,
    required BuildContext context,
    required String text,
    required String iconPath,
  }) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: callback,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 60,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 16,
                  ),
                  child: Image.asset(
                    iconPath,
                    fit: BoxFit.contain,
                  ),
                ),
                Text(
                  text,
                  style: CustomTextStyles.of(context).regular12,
                )
              ],
            ),
          ),
          Divider(
            height: 1,
            color: CustomColors.of(context).inactive.withOpacity(0.25),
          ),
        ],
      ),
    );
  }
}
