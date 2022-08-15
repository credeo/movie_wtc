import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_wtc/extensions/custom_colors.dart';
import 'package:movie_wtc/extensions/custom_text_styles.dart';
import 'package:movie_wtc/providers/profile_provider.dart';
import 'package:movie_wtc/widgets/custom_app_bar.dart';
import 'package:provider/provider.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({Key? key}) : super(key: key);
  static const pageName = 'edit_profile';
  //static const pageNameFromProfile = 'edit_profile';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProfileProvider(),
      child: Consumer<ProfileProvider>(
        builder: ((context, profileProvider, child) {
          return Scaffold(
            backgroundColor: CustomColors.of(context).background,
            appBar: const CustomAppBar(
              isProfilePage: true,
              hasBackButton: true,
              hasNotificationButton: true,
            ),
            body: Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 8),
              child: Column(
                children: [
                  Center(
                    child: Image.asset(
                      'assets/icons/icon_profile_big.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'edit_profile_avatar'.tr(),
                    style: CustomTextStyles.of(context)
                        .regular12
                        .apply(color: CustomColors.of(context).primary),
                  ),
                  Stack(
                    children: [
                      Positioned(
                        width: MediaQuery.of(context).size.width,
                        child: Container(
                          height: 285,
                          margin: const EdgeInsets.only(
                              left: 22, right: 18, top: 27),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(53),
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                CustomColors.of(context).tabbarGradientStart,
                                CustomColors.of(context).tabbarGradientEnd,
                              ],
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        heightFactor: 6.65,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: CustomColors.of(context).primary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            fixedSize: const Size(151, 50),
                          ),
                          onPressed: () {
                            profileProvider.nameProfile();
                            context.pop();
                          },
                          child: Text(
                            'edit_confirm'.tr(),
                            style: CustomTextStyles.of(context).semiBold16,
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          const SizedBox(height: 50),
                          cellTextField(
                            context,
                            'assets/icons/icon_profile_small.png',
                            'edit_profile_name'.tr(),
                            profileProvider,
                          ),
                          const SizedBox(height: 12),
                          cellTextField(
                            context,
                            'assets/icons/icon_eye_crossed.png',
                            'edit_profile_new_pass'.tr(),
                            null,
                          ),
                          const SizedBox(height: 12),
                          cellTextField(
                            context,
                            'assets/icons/icon_eye_crossed.png',
                            'edit_profile_confirm_pass'.tr(),
                            null,
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}

Widget cellTextField(BuildContext context, String imagePath, String hintText,
    ProfileProvider? profileProvider) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 56),
    child: TextField(
      style: CustomTextStyles.of(context)
          .regular17
          .apply(color: CustomColors.of(context).textCursor),
      cursorColor: CustomColors.of(context).textCursor,
      controller: profileProvider?.controller,
      decoration: InputDecoration(
        prefixIconConstraints: const BoxConstraints(maxWidth: 35),
        prefixIcon: Align(
          alignment: Alignment.centerLeft,
          child: Image.asset(imagePath),
        ),
        hintText: hintText,
        hintStyle: CustomTextStyles.of(context).regular15,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            style: BorderStyle.solid,
            color: CustomColors.of(context).underlineProfile,
          ),
        ),
      ),
    ),
  );
}
